#include "../common/stm32wrapper.h"
#include <stdio.h>
#include <stdint.h>
#include <string.h>

#define NUMBER_OF_ROUNDS 27

#define ALPHA 8
#define BETA 3

#define rot32r8(x) ((x >> 8) | (x << 24))
#define rot32l3(x) ((x << 3) | (x >> 29))
#define rot32r3(x) ((x >> 3) | (x << 29))
#define rot32l8(x) ((x << 8) | (x >> 24))

void speck64_keyschedule(const uint8_t *key, uint8_t *rk)
{
  uint32_t *key32       = (uint32_t *)key;
  uint32_t *roundKeys32 = (uint32_t *)rk;

  uint32_t y    = key32[0];
  uint32_t x    = key32[1];
  uint32_t key2 = key32[2];
  uint32_t key3 = key32[3];
  uint32_t tmp;

  uint8_t i = 0;

  while(1) {

    roundKeys32[i] = y;

    if (i == NUMBER_OF_ROUNDS-1) break;

    x = (rot32r8(x) + y) ^ i++;
    y = rot32l3(y) ^ x;

    tmp  = x;
    x    = key2;
    key2 = key3;
    key3 = tmp; 

  }    
}

void speck64_keyschedule_dec(const uint8_t *key, uint8_t *rk)
{
    speck64_keyschedule(key, rk);
}

void speck64_encrypt(const uint8_t *rk, const uint8_t *in, uint8_t *out)
{
  uint32_t *block32  = (uint32_t *)in;
  uint32_t *outblock = (uint32_t *)out;

  const uint32_t *roundKeys = (uint32_t *)rk;

  uint32_t y = block32[0];
  uint32_t x = block32[1];

  uint8_t i;

  for (i=0; i < NUMBER_OF_ROUNDS; i++) {
    x = (rot32r8(x) + y) ^ (roundKeys[i]);
    y = rot32l3(y) ^ x;

  }

  outblock[0] = y;
  outblock[1] = x;
}

void speck64_decrypt(const uint8_t *rk, const uint8_t *in, uint8_t *out)
{
  uint32_t *block32  = (uint32_t *)in;
  uint32_t *outblock = (uint32_t *)out;

  const uint32_t *roundKeys = (uint32_t *)rk;

  uint32_t y = block32[0];
  uint32_t x = block32[1];

  int8_t i;

  for (i = NUMBER_OF_ROUNDS - 1; i >= 0; --i) {
    y = rot32r3(x ^ y);
    x = rot32l8((x ^ rk[i]) - y);
  }

  outblock[0] = y;
  outblock[1] = x;
}

int main(void)
{
    clock_setup();
    gpio_setup();
    usart_setup(115200);

    // plainly reading from CYCCNT is more efficient than using the
    // dwt_read_cycle_counter() interface offered by libopencm3,
    // as this adds extra overhead because of the function call

    SCS_DEMCR |= SCS_DEMCR_TRCENA;
    DWT_CYCCNT = 0;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;
    
    const uint8_t key[16] = {4,5,6,7,4,5,6,8,4,5,6,9,4,5,6,10};
    uint8_t in[8] = {0,0,0,0,1,2,3,1};
    uint8_t out[8];
    
    uint8_t rk[(NUMBER_OF_ROUNDS+1)*4];
    char buffer[36];

    memcpy(rk, key, 16);

    unsigned int oldcount = DWT_CYCCNT;
    speck64_keyschedule(key, rk);
    unsigned int cyclecount = DWT_CYCCNT-oldcount;

/*
    // Print all round keys
    unsigned int i,j;
    for(i=0;i<11*4;++i) {
        sprintf(buffer, "rk[%2d]: ", i);
        for(j=0;j<4;++j)
            sprintf(buffer+2*j+8, "%02x", rk[i*4+j]);
        send_USART_str(buffer);
    }
*/

    sprintf(buffer, "cyc: %d", cyclecount); 
    send_USART_str(buffer);

    oldcount = DWT_CYCCNT;
    speck64_encrypt(rk, in, out);
    cyclecount = DWT_CYCCNT-oldcount;

    sprintf(buffer, "cyc: %d", cyclecount); 
    send_USART_str(buffer);
    
/*
    // Print ciphertext
    sprintf(buffer, "out: ");
    send_USART_str(buffer);
    for(i=0;i<16;++i)
        sprintf(buffer+2*i, "%02x", out[i]);
    send_USART_str(buffer);
*/

    memcpy(rk+160, key, 16);

    oldcount = DWT_CYCCNT;
    speck64_keyschedule_dec(key, rk);
    cyclecount = DWT_CYCCNT-oldcount;

/*
    // Print all decryption round keys
    for(i=0;i<11*4;++i) {
        sprintf(buffer, "rk[%2d]: ", i);
        for(j=0;j<4;++j)
            sprintf(buffer+2*j+8, "%02x", rk[i*4+j]);
        send_USART_str(buffer);
    }
*/

    sprintf(buffer, "cyc: %d", cyclecount); 
    send_USART_str(buffer);

    oldcount = DWT_CYCCNT;
    speck64_decrypt(rk, out, in);
    cyclecount = DWT_CYCCNT-oldcount;

    sprintf(buffer, "cyc: %d", cyclecount); 
    send_USART_str(buffer);
    
/*
    // Print plaintext
    sprintf(buffer, "in: ");
    send_USART_str(buffer);
    for(i=0;i<16;++i)
        sprintf(buffer+2*i, "%02x", in[i]);
    send_USART_str(buffer);
*/

    while (1);

    return 0;
}

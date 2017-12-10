.syntax unified
.thumb

@ void speck128_keyschedule(const uint8_t *key,
@       uint8_t *rk) {
.global speck128_keyschedule
.type   speck128_keyschedule,%function
speck128_keyschedule:

    //function prologue, preserve registers
    push {r4-r11}

    //load key
    ldm r0, {r4-r7}

    //implement key schedule

    //write to memory
    //stmia.w r1!, {r4-r7} is slower if we can use encoding T1!
    str r4, [r1, #16]
    str r5, [r1, #20]
    str r6, [r1, #24]
    str r7, [r1, #28]

    //function epilogue, restore state
    pop {r4-r11}
    bx lr


.align 2
@ void speck128_encrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global speck128_encrypt
.type   speck128_encrypt,%function
speck128_encrypt:

    //function prologue, preserve registers and free r2
    push {r2,r4-r12,r14}

    //load input
    ldm r1, {r4-r7} //r1 now free to overwrite
    //load key
    ldmia r0!, {r8-r11}
    mov.w r14, r0

    //implement round function
        
    //write output
    stm r4, {r0-r3}

    //function epilogue, restore state
    pop {r4-r12,r14}
    bx lr

@ void speck128_keyschedule_dec(const uint8_t *key,
@       const uint8_t *rk) {
.global speck128_keyschedule_dec
.type   speck128_keyschedule_dec,%function
speck128_keyschedule_dec:

    //function prologue, preserve registers
    push {r4-r11}

    //load key
    ldm r0, {r4-r7}

    //implement key schedule
    

    //write to memory
    //stmia.w r1!, {r4-r7} is slower if we can use encoding T1!
    str r4, [r1, #16]
    str r5, [r1, #20]
    str r6, [r1, #24]
    str r7, [r1, #28]

    //function epilogue, restore state
    pop {r4-r11}
    bx lr
.ltorg

.align 4
@ void speck128_decrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global speck128_decrypt
.type   speck128_decrypt,%function
speck128_decrypt:

    //function prologue, preserve registers and free r2
    push {r2,r4-r12,r14}

    //load input
    ldm r1, {r4-r7} //r1 now free to overwrite
    //load key
    ldmia r0!, {r8-r11}
    mov.w r14, r0

    //implement round function here

    //write output
    stm r2, {r4-r7}

    //function epilogue, restore state
    pop {r4-r12,r14}
    bx lr


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
    
    //Round 0
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 1
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 2
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 3
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 4
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 5
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 6
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 7
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 8
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 9
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 10
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 11
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 12
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 13
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 14
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 15
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 16
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 17
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 18
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 19
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 20
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 21
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 22
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 23
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 24
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 25
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 26
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 27
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 28
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 29
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 30
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 31
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 32
    ldmia r0!, {r8-r11}
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r8
    eor r5, r5, r9
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7
    //Round 33
    lsr r1, r4, #24
    lsr r2, r5, #24
    orr r4, r1, r4, lsl #8
    orr r5, r2, r5, lsl #8
    add r4, r4, r6
    adc r5, r5, r7
    eor r4, r4, r10
    eor r5, r5, r11
    lsl r1, r6, #29
    lsl r2, r7, #29
    orr r6, r1, r6, lsr #3
    orr r7, r2, r7, lsr #3
    eor r6, r4, r6
    eor r7, r5, r7

    //write output
    pop.w {r2}
    stm r2, {r4-r7}

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


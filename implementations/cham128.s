.syntax unified
.thumb

@ void cham128_keyschedule(const uint8_t *key,
@       uint8_t *rk) {
.global cham128_keyschedule
.type   cham128_keyschedule,%function
cham128_keyschedule:

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
@ void cham128_encrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global cham128_encrypt
.type   cham128_encrypt,%function
cham128_encrypt:
    //function prologue, preserve registers and free r2
    push {r2,r4-r12,r14}

    //load input
    ldm r1, {r4-r7} //r1 now free to overwrite
    
    //Round 0
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 1
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 2
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 3
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 4
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 5
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 6
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 7
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 8
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 9
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 10
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 11
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 12
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 13
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 14
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 15
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 16
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 17
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 18
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 19
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 20
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 21
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30
    //Round 22
    eor r4, r4, #2
    eor r1, r8, r5, ror #30
    add r4, r4, r1, ror #24
    eor r5, r5, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1, ror #30
    eor r6, r6, #6
    eor r1, r8, r7, ror #30
    add r6, r6, r1, ror #24
    eor r7, r7, #8
    eor r1, r9, r4, ror #24
    add r7, r7, r1, ror #30



    //write output
    pop.w {r2}
    stm r2, {r4-r7}

    //function epilogue, restore state
    pop {r4-r12,r14}
    bx lr

@ void cham128_keyschedule_dec(const uint8_t *key,
@       const uint8_t *rk) {
.global cham128_keyschedule_dec
.type   cham128_keyschedule_dec,%function
cham128_keyschedule_dec:

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
@ void cham128_decrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global cham128_decrypt
.type   cham128_decrypt,%function
cham128_decrypt:

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


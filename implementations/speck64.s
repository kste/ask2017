.syntax unified
.thumb

@ void speck64_keyschedule(const uint8_t *key,
@       uint8_t *rk) {
.global speck64_keyschedule
.type   speck64_keyschedule,%function
speck64_keyschedule:

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
@ void speck64_encrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global speck64_encrypt
.type   speck64_encrypt,%function
speck64_encrypt:
    //function prologue, preserve registers and free r2
    push {r2,r4-r12,r14}

    //load input
    ldm r1, {r3-r4} //r1 now free to overwrite

    ldmia r0!, {r5-r12}
    //Round 0
    add r3, r4, r3, ror #24
    eor r3, r3, r5
    eor r4, r3, r4, ror #3
    //Round 1
    add r3, r4, r3, ror #24
    eor r3, r3, r6
    eor r4, r3, r4, ror #3
    //Round 2
    add r3, r4, r3, ror #24
    eor r3, r3, r7
    eor r4, r3, r4, ror #3
    //Round 3
    add r3, r4, r3, ror #24
    eor r3, r3, r8
    eor r4, r3, r4, ror #3
    //Round 4
    add r3, r4, r3, ror #24
    eor r3, r3, r9
    eor r4, r3, r4, ror #3
    //Round 5
    add r3, r4, r3, ror #24
    eor r3, r3, r10
    eor r4, r3, r4, ror #3
    //Round 6
    add r3, r4, r3, ror #24
    eor r3, r3, r11
    eor r4, r3, r4, ror #3
    //Round 7
    add r3, r4, r3, ror #24
    eor r3, r3, r12
    eor r4, r3, r4, ror #3
    ldmia r0!, {r5-r12}
    //Round 8
    add r3, r4, r3, ror #24
    eor r3, r3, r5
    eor r4, r3, r4, ror #3
    //Round 9
    add r3, r4, r3, ror #24
    eor r3, r3, r6
    eor r4, r3, r4, ror #3
    //Round 10
    add r3, r4, r3, ror #24
    eor r3, r3, r7
    eor r4, r3, r4, ror #3
    //Round 11
    add r3, r4, r3, ror #24
    eor r3, r3, r8
    eor r4, r3, r4, ror #3
    //Round 12
    add r3, r4, r3, ror #24
    eor r3, r3, r9
    eor r4, r3, r4, ror #3
    //Round 13
    add r3, r4, r3, ror #24
    eor r3, r3, r10
    eor r4, r3, r4, ror #3
    //Round 14
    add r3, r4, r3, ror #24
    eor r3, r3, r11
    eor r4, r3, r4, ror #3
    //Round 15
    add r3, r4, r3, ror #24
    eor r3, r3, r12
    eor r4, r3, r4, ror #3
    ldmia r0!, {r5-r12}
    //Round 16
    add r3, r4, r3, ror #24
    eor r3, r3, r5
    eor r4, r3, r4, ror #3
    //Round 17
    add r3, r4, r3, ror #24
    eor r3, r3, r6
    eor r4, r3, r4, ror #3
    //Round 18
    add r3, r4, r3, ror #24
    eor r3, r3, r7
    eor r4, r3, r4, ror #3
    //Round 19
    add r3, r4, r3, ror #24
    eor r3, r3, r8
    eor r4, r3, r4, ror #3
    //Round 20
    add r3, r4, r3, ror #24
    eor r3, r3, r9
    eor r4, r3, r4, ror #3
    //Round 21
    add r3, r4, r3, ror #24
    eor r3, r3, r10
    eor r4, r3, r4, ror #3
    //Round 22
    add r3, r4, r3, ror #24
    eor r3, r3, r11
    eor r4, r3, r4, ror #3
    //Round 23
    add r3, r4, r3, ror #24
    eor r3, r3, r12
    eor r4, r3, r4, ror #3
    ldmia r0!, {r5-r7}
    //Round 24
    add r3, r4, r3, ror #24
    eor r3, r3, r5
    eor r4, r3, r4, ror #3
    //Round 25
    add r3, r4, r3, ror #24
    eor r3, r3, r6
    eor r4, r3, r4, ror #3
    //Round 26
    add r3, r4, r3, ror #24
    eor r3, r3, r7
    eor r4, r3, r4, ror #3


    //write output
    pop.w {r2}
    stm r2, {r3-r5}

    //function epilogue, restore state
    pop {r4-r12,r14}
    bx lr

@ void speck64_keyschedule_dec(const uint8_t *key,
@       const uint8_t *rk) {
.global speck64_keyschedule_dec
.type   speck64_keyschedule_dec,%function
speck64_keyschedule_dec:

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
@ void speck64_decrypt(const uint8_t *rk,
@       const uint8_t *in, uint8_t *out) {
.global speck64_decrypt
.type   speck64_decrypt,%function
speck64_decrypt:

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


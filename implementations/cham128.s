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
    ldmia r0!, {r8-r11}
    eor r4, r4, #0
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #0
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #0
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #0
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 4
    ldmia r0!, {r8-r11}
    eor r4, r4, #4
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #4
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #4
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #4
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 8
    ldmia r0!, {r8-r11}
    eor r4, r4, #8
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #8
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #8
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #8
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 12
    ldmia r0!, {r8-r11}
    eor r4, r4, #12
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #12
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #12
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #12
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 16
    ldmia r0!, {r8-r11}
    eor r4, r4, #16
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #16
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #16
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #16
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 20
    ldmia r0!, {r8-r11}
    eor r4, r4, #20
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #20
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #20
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #20
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 24
    ldmia r0!, {r8-r11}
    eor r4, r4, #24
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #24
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #24
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #24
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 28
    ldmia r0!, {r8-r11}
    eor r4, r4, #28
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #28
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #28
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #28
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 32
    ldmia r0!, {r8-r11}
    eor r4, r4, #32
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #32
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #32
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #32
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 36
    ldmia r0!, {r8-r11}
    eor r4, r4, #36
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #36
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #36
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #36
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 40
    ldmia r0!, {r8-r11}
    eor r4, r4, #40
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #40
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #40
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #40
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 44
    ldmia r0!, {r8-r11}
    eor r4, r4, #44
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #44
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #44
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #44
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 48
    ldmia r0!, {r8-r11}
    eor r4, r4, #48
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #48
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #48
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #48
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 52
    ldmia r0!, {r8-r11}
    eor r4, r4, #52
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #52
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #52
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #52
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 56
    ldmia r0!, {r8-r11}
    eor r4, r4, #56
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #56
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #56
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #56
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 60
    ldmia r0!, {r8-r11}
    eor r4, r4, #60
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #60
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #60
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #60
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 64
    ldmia r0!, {r8-r11}
    eor r4, r4, #64
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #64
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #64
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #64
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 68
    ldmia r0!, {r8-r11}
    eor r4, r4, #68
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #68
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #68
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #68
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 72
    ldmia r0!, {r8-r11}
    eor r4, r4, #72
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #72
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #72
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #72
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24
    //Round 76
    ldmia r0!, {r8-r11}
    eor r4, r4, #76
    eor r1, r8, r5, ror #31
    add r4, r4, r1
    ror r4, r4, #24
    eor r5, r4, #76
    eor r1, r9, r6, ror #24
    add r5, r5, r1
    ror r5, r5, #31
    eor r6, r6, #76
    eor r1, r10, r6, ror #31
    add r6, r6, r1
    ror r6, r6, #24
    eor r7, r7, #76
    eor r1, r11, r4, ror #31
    add r7, r7, r1
    ror r7, r7, #24




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


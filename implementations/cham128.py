# Script to generate round function for Speck64 in ARM assembly

rounds = 80

# Do 4 rounds at once
for r in range(rounds // 4):
    print("    //Round {}".format(4*r))
    print("    ldmia r0!, {r8-r11}")
    print("    eor r4, r4, #{}".format(4*r))
    print("    eor r1, r8, r5, ror #31")
    print("    add r4, r4, r1")
    print("    ror r4, r4, #24")

    print("    eor r5, r4, #{}".format(4*r))
    print("    eor r1, r9, r6, ror #24")
    print("    add r5, r5, r1")
    print("    ror r5, r5, #31")

    print("    eor r6, r6, #{}".format(4*r))
    print("    eor r1, r10, r6, ror #31")
    print("    add r6, r6, r1")
    print("    ror r6, r6, #24")

    print("    eor r7, r7, #{}".format(4*r))
    print("    eor r1, r11, r4, ror #31")
    print("    add r7, r7, r1")
    print("    ror r7, r7, #24")            


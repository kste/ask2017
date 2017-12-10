# Script to generate round function for Speck64 in ARM assembly

rounds = 92
# Do 4 rounds at once
for r in range(rounds // 4):
    print("    //Round {}".format(r))
    print("    eor r4, r4, #2")
    print("    eor r1, r8, r5, ror #30")
    print("    add r4, r4, r1, ror #24")

    print("    eor r5, r5, #4")
    print("    eor r1, r9, r6, ror #24")
    print("    add r5, r5, r1, ror #30")

    print("    eor r6, r6, #6")
    print("    eor r1, r8, r7, ror #30")
    print("    add r6, r6, r1, ror #24")

    print("    eor r7, r7, #8")
    print("    eor r1, r9, r4, ror #24")
    print("    add r7, r7, r1, ror #30")


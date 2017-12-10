# Script to generate round function for Speck128 in ARM assembly

rounds = 34

for r in range(0, rounds, 2):
	# Two rounds at a time
	print("    //Round {}".format(r))
	# Load keys
	print("    ldmia r0!, {r8-r11}")
	print("    lsr r1, r4, #24")
	print("    lsr r2, r5, #24")
	print("    orr r4, r1, r4, lsl #8")
	print("    orr r5, r2, r5, lsl #8")
	print("    add r4, r4, r6")
	print("    adc r5, r5, r7")
	print("    eor r4, r4, r8")
	print("    eor r5, r5, r9")
	print("    lsl r1, r6, #29")
	print("    lsl r2, r7, #29")
	print("    orr r6, r1, r6, lsr #3")
	print("    orr r7, r2, r7, lsr #3")
	print("    eor r6, r4, r6")
	print("    eor r7, r5, r7")

	print("    //Round {}".format(r + 1))
	print("    lsr r1, r4, #24")
	print("    lsr r2, r5, #24")
	print("    orr r4, r1, r4, lsl #8")
	print("    orr r5, r2, r5, lsl #8")
	print("    add r4, r4, r6")
	print("    adc r5, r5, r7")
	print("    eor r4, r4, r10")
	print("    eor r5, r5, r11")
	print("    lsl r1, r6, #29")
	print("    lsl r2, r7, #29")
	print("    orr r6, r1, r6, lsr #3")
	print("    orr r7, r2, r7, lsr #3")
	print("    eor r6, r4, r6")
	print("    eor r7, r5, r7")



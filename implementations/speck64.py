# Script to generate round function for Speck64 in ARM assembly

# First 24 rounds
for r in range(24):
	if (r % 8) == 0:
		# Load keys
		print("    ldmia r0!, {r5-r12}")
	print("    //Round {}".format(r))
	print("    add r3, r4, r3, ror #24")
	print("    eor r3, r3, r{}".format(5 + (r % 8)))
	print("    eor r4, r3, r4, ror #3")

# Last 3 rounds
print("    ldmia r0!, {r5-r7}")
print("    //Round 24")
print("    add r3, r4, r3, ror #24")
print("    eor r3, r3, r5")
print("    eor r4, r3, r4, ror #3")
print("    //Round 25")
print("    add r3, r4, r3, ror #24")
print("    eor r3, r3, r6")
print("    eor r4, r3, r4, ror #3")
print("    //Round 26")
print("    add r3, r4, r3, ror #24")
print("    eor r3, r3, r7")
print("    eor r4, r3, r4, ror #3")

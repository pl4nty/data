local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 2097152 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "PUA:Block:Ardamax:Bit"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

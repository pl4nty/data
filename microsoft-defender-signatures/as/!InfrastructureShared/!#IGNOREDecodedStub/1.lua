local L0_1, L1_1, L2_1
L0_1 = string
L0_1 = L0_1.sub
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1 = L1_1()
L2_1 = -16
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == "->(EmbeddedCode)" then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

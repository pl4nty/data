local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+\\)([^\\]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 1
L6_1 = 9
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == "dpservice" then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

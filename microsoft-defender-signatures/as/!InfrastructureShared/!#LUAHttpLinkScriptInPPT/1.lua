local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "%-%>ppt%/"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

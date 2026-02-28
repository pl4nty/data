local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -7
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == ".config" then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

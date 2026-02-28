local L0_1, L1_1, L2_1, L3_1
L0_1 = getTamperProtectionSource
L0_1 = L0_1()
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

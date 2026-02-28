local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.LOWFI
  return L0_1
end
L0_1 = reportDetectedRegions
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1

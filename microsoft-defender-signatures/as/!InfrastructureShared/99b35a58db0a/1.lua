local L0_1, L1_1
L0_1 = reportSessionInformation
L0_1 = L0_1()
L1_1 = L0_1.Session
L1_1 = L1_1.ClientProtocolType
if L1_1 == 2 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

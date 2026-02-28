local L0_1, L1_1, L2_1, L3_1
L0_1 = GetRollingQueueCount
L1_1 = "FireFalcon_Clash"
L0_1 = L0_1(L1_1)
if 0 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = MpCommon
L0_1 = L0_1.RollingQueueCreate
L1_1 = "FireFalcon_Clash"
L2_1 = 1
L3_1 = 172800
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = GetRollingQueueKeyValue
L1_1 = "IsExchgServerTainted"
L2_1 = "MpEnableTaintTracking"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == nil then
  L1_1 = AppendToRollingQueue
  L2_1 = "IsExchgServerTainted"
  L3_1 = "MpEnableTaintTracking"
  L4_1 = 1
  L5_1 = 604800
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

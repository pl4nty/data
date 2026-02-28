local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsKeyInRollingQueue
L1_1 = "PowershellAMSIpatch_Bytes"
L2_1 = "Bytes"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetRollingQueueKeyValue
L1_1 = "PowershellAMSIpatch_Bytes"
L2_1 = "Bytes"
L0_1 = L0_1(L1_1, L2_1)
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "AMSIBYTES:"
L3_1 = L0_1
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = pcall
L2_1 = MpCommon
L2_1 = L2_1.RollingQueueErase
L3_1 = "PowershellAMSIpatch_Bytes"
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

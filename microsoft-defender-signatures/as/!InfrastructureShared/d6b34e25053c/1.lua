local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = triggerMemoryScanOnProcessTree
L1_1 = true
L2_1 = true
L3_1 = "SMS_H"
L4_1 = 5000
L5_1 = "Behavior:Win32/ICEBreak.SA"
L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L0_1 = add_parents
L0_1()
L0_1 = pcall
L1_1 = reportBmInfo
L0_1, L1_1 = L0_1(L1_1)
if not L0_1 and L1_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "bmInfoFailReason"
  L4_1 = tostring
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1

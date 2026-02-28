local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.IsFriendlyProcess
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = triggerMemoryScanOnProcessTree
L2_1 = true
L3_1 = true
L4_1 = "EMS"
L5_1 = 5000
L6_1 = "Behavior:Win32/CobaltStrike.B!nri"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = pcall
L2_1 = reportBmInfo
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 and L2_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "bmInfoFailReason"
  L5_1 = tostring
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1

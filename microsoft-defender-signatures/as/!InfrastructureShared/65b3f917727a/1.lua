local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = false
L2_1 = false
if L0_1 then
  L3_1 = L0_1.pid
  if L3_1 then
    goto lbl_14
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_14::
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.QuerySessionInformation
L5_1 = L0_1.ppid
L6_1 = MpCommon
L6_1 = L6_1.WTSIsRemoteSession
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L1_1 = L4_1
L2_1 = L3_1
if L2_1 and L1_1 then
  L3_1 = reportSessionInformation
  L3_1()
  L3_1 = reportRelevantUntrustedEntities
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

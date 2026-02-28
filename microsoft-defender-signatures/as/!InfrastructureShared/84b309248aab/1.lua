local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = false
L2_1 = false
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
  L3_1 = reportSessionInformationInclusive
  L3_1()
  L3_1 = addOverallNetworkVolume
  L3_1()
  L3_1 = add_parents
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

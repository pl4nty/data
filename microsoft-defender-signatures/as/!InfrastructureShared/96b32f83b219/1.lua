local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.QuerySessionInformation
L2_1 = L0_1.ppid
L3_1 = MpCommon
L3_1 = L3_1.WTSIsRemoteSession
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.request_SMS
L2_1 = L0_1.ppid
L3_1 = "H"
L1_1(L2_1, L3_1)
L1_1 = bm
L1_1 = L1_1.add_action
L2_1 = "SmsAsyncScanEvent"
L3_1 = 5000
L1_1(L2_1, L3_1)
L1_1 = TrackPidAndTechniqueBM
L2_1 = L0_1.ppid
L3_1 = "T1055.002"
L4_1 = "processinjection_source"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

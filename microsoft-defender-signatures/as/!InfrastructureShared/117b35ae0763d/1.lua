local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "svchost.exe -k camera -s frameserver"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.request_SMS
L3_1 = L0_1.ppid
L4_1 = "H"
L2_1(L3_1, L4_1)
L2_1 = bm
L2_1 = L2_1.add_action
L3_1 = "SmsAsyncScanEvent"
L4_1 = 100
L2_1(L3_1, L4_1)
L2_1 = TrackPidAndTechniqueBM
L3_1 = L0_1.ppid
L4_1 = "T1055.002"
L5_1 = "processinjection_source"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1

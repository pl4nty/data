local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
if L1_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1
  L4_1 = "T1055.012"
  L5_1 = "processhollowing_target"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = bm
  L2_1 = L2_1.request_SMS
  L3_1 = L1_1
  L4_1 = "M"
  L2_1(L3_1, L4_1)
  L2_1 = bm
  L2_1 = L2_1.add_action
  L3_1 = "SmsAsyncScanEvent"
  L4_1 = 1000
  L2_1(L3_1, L4_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1

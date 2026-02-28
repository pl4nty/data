local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.request_SMS
L2_1 = L0_1.ppid
L3_1 = "h+"
L1_1(L2_1, L3_1)
L1_1 = bm
L1_1 = L1_1.add_action
L2_1 = "SmsAsyncScanEvent"
L3_1 = 10000
L1_1(L2_1, L3_1)
L1_1 = AppendToRollingQueue
L2_1 = "PowershellAMSIpatch"
L3_1 = "Amsi"
L4_1 = "1"
L5_1 = 86400
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

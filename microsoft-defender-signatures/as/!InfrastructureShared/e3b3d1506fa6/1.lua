local L0_1, L1_1, L2_1, L3_1, L4_1
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
L1_1 = bm
L1_1 = L1_1.trigger_sig_delayed
L2_1 = "ForceSmsExit"
L3_1 = "H"
L4_1 = 120000
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.request_SMS
L2_1 = L0_1.ppid
L3_1 = "l+"
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

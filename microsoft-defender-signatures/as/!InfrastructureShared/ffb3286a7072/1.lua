local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.request_SMS
L2_1 = L0_1.ppid
L3_1 = "M"
L1_1(L2_1, L3_1)
L1_1 = bm
L1_1 = L1_1.add_action
L2_1 = "SmsAsyncScanEvent"
L3_1 = 100
L1_1(L2_1, L3_1)
L1_1 = pcallEx
L2_1 = "triggerMemoryScanOnProcessTree"
L3_1 = triggerMemoryScanOnProcessTree
L4_1 = true
L5_1 = false
L6_1 = "SMS_H"
L7_1 = 100
L8_1 = "Behavior:Win32/Ryuk.B!rsm"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = pcallEx
L2_1 = "triggerMemoryScanOnProcessTree"
L3_1 = triggerMemoryScanOnProcessTree
L4_1 = true
L5_1 = false
L6_1 = "EMS"
L7_1 = 100
L8_1 = "Behavior:Win32/Ryuk.B!rsm"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

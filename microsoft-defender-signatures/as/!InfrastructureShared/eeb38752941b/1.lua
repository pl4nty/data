local L0_1, L1_1
L0_1 = checkLogonSuccessEvent
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L0_1(L1_1)
L0_1 = reportLuaErrors
L1_1 = "LogonSuccess.A"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

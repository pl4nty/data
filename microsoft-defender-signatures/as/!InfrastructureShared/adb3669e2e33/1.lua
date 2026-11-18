-- Threat: !InfrastructureShared
-- Name: adb3669e2e33
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
MpCommon.TurnNriOnProcess(l_0_0.ppid)
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 65b333aea35d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "M")
return mp.INFECTED

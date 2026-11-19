-- Threat: !InfrastructureShared
-- Name: 5bb325fe818b
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "l+")
return mp.CLEAN

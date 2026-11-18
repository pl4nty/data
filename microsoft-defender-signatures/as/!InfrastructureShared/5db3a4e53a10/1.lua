-- Threat: !InfrastructureShared
-- Name: 5db3a4e53a10
-- Type: 21
-- Includes: BMLuaLib

reportRelatedBmHits()
local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED

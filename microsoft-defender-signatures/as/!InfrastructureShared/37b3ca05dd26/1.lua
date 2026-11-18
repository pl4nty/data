-- Threat: !InfrastructureShared
-- Name: 37b3ca05dd26
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1)
reportRelatedBmHits()
return mp.INFECTED

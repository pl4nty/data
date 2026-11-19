-- Threat: !InfrastructureShared
-- Name: 25b3fa772ce7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.ppid
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1, "T1055.012", "processhollowing_target")
  bm.request_SMS(l_0_1, "M")
  bm.add_action("SmsAsyncScanEvent", 1000)
end
return mp.INFECTED

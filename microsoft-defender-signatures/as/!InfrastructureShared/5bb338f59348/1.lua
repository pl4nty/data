-- Threat: !InfrastructureShared
-- Name: 5bb338f59348
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\mpsigstub.exe", 1, true) or string.find(l_0_0, "\\mpcmdrun.exe", 1, true) or string.find(l_0_0, "\\threat prevention\\mfetp.exe", 1, true) or string.find(l_0_0, "\\dialer.exe", 1, true) or string.find(l_0_0, "\\nschim.exe", 1, true) or string.find(l_0_0, "\\wininit.exe", 1, true) then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED

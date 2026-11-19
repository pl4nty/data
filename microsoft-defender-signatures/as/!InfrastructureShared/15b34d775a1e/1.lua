-- Threat: !InfrastructureShared
-- Name: 15b34d775a1e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackCustomPersistContextNameByPPID("set", l_0_0.ppid, "MimikatzTrigger")
  bm.request_SMS(l_0_0.ppid, "M")
end
return mp.INFECTED

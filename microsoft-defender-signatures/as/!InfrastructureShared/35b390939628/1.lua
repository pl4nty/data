-- Threat: !InfrastructureShared
-- Name: 35b390939628
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil then
  l_0_0 = l_0_1.ppid
end
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0, "T1027", "tt-thresholdmet")
end
return mp.INFECTED

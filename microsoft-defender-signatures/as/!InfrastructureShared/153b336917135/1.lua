-- Threat: !InfrastructureShared
-- Name: 153b336917135
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  TrackPidAndTechniqueBM(l_0_0, "T1059.006", "Execution")
  TrackPidAndTechniqueBM(l_0_0, "T1071.001", "CommandAndControl")
  return mp.INFECTED
end
return mp.CLEAN

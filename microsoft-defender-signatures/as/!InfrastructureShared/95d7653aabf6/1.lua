-- Threat: !InfrastructureShared
-- Name: 95d7653aabf6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  ["T1098.007"] = "persist_user_local",
  ["T1136.001"] = "persist_user_local"
}
TrackPidAndMultipleTechniques("CMDHSTR", l_0_0)
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 and l_0_1.ppid then
  TrackPidAndMultipleTechniques(l_0_1.ppid, l_0_0)
end
return mp.INFECTED

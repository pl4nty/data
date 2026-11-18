-- Threat: !InfrastructureShared
-- Name: 7bd704e3ff45
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = GetRealPidForScenario("CMDHSTR")
TrackPidAndTechnique(l_0_2, "T1003", "ntdsutil_shadowcopy_access")
local l_0_3 = {
  "\\perflogs\\",
  "\\public\\",
  "c:\\temp",
  "\\windows\\temp\\",
  "\\music\\"
}
if contains(l_0_1, l_0_3) then
  return mp.INFECTED
end
return mp.LOWFI

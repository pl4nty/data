-- Threat: !InfrastructureShared
-- Name: 33d756419d10
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "certipy", 1, true) or not string.find(l_0_1, " template ", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certipy_esc4_template_mod_v5")
return mp.INFECTED

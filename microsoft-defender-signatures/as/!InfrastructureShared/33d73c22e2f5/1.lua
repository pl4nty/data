-- Threat: !InfrastructureShared
-- Name: 33d73c22e2f5
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
if string.find(l_0_1, "certutil", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "certify", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "find", 1, true) or string.find(l_0_1, "enum-", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certify_adcs_recon_sharpcollection")
return mp.INFECTED

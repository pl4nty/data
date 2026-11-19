-- Threat: !InfrastructureShared
-- Name: 29d7924a105a
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
local l_0_2 = string.find(l_0_1, "ca-cert", 1, true) or string.find(l_0_1, "cacertpath", 1, true) or string.find(l_0_1, "subject", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certify_golden_cert_forge")
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 5bd76f127ab6
-- Type: 21
-- Includes: TechniqueTracker, HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
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
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certify_esc1_request")
return mp.INFECTED

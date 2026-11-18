-- Threat: !InfrastructureShared
-- Name: 39d76f7eb28c
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
local l_0_2 = {"certipy", "-pfx "}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if not string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certipy_pkinit_auth")
return mp.INFECTED

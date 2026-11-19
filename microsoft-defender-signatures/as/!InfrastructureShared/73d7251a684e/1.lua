-- Threat: !InfrastructureShared
-- Name: 73d7251a684e
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if not string.find(l_0_1, "gcc%s") and not string.find(l_0_1, "clang%s") then
  return mp.CLEAN
end
if not (string.find(l_0_1, "%-shared") and string.find(l_0_1, "%-lpam") and string.find(l_0_1, "%-lcurl")) or not string.find(l_0_1, "%-o%s+/tmp/[^%s/]-pam[^%s/]-%.so") then
  return mp.CLEAN
end
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 5bb354fcd9ca
-- Type: 21

if not this_sigattrlog[2].ppid then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil and (string.match(l_0_0, "baseboard") or string.match(l_0_0, "manufacturer")) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[2].ppid)
if l_0_1 and l_0_1.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN

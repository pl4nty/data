-- Threat: !InfrastructureShared
-- Name: 10ab30081ee7f
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil and this_sigattrlog[10].ppid ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p2)
  l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[10].ppid)
end
if l_0_0 == nil or #l_0_0 <= 20 or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.IntegrityLevel < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
if string.find(l_0_0, "-enc", 1, true) ~= nil or string.find(l_0_0, ".downloadstring(", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

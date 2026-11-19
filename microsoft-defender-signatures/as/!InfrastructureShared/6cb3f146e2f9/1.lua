-- Threat: !InfrastructureShared
-- Name: 6cb3f146e2f9
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
if string.find(l_0_0, ":\\windows\\", 1, true) then
  return mp.CLEAN
end
l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if l_0_1 == nil or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_threat_file(l_0_0)
bm.add_threat_file(l_0_1)
return mp.INFECTED

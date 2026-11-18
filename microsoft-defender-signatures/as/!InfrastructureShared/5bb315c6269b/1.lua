-- Threat: !InfrastructureShared
-- Name: 5bb315c6269b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if l_0_0 == nil or string.find(l_0_1, "\\windows\\system32\\", 1, true) == nil or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_threat_file(l_0_1)
return mp.INFECTED

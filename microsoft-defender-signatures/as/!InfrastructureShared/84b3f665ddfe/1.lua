-- Threat: !InfrastructureShared
-- Name: 84b3f665ddfe
-- Type: 21

local l_0_0
l_0_0 = this_sigattrlog[2].utf8p2
local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if l_0_0 == nil or string.find(l_0_1, "\\windows\\system32\\", 1, true) or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
return mp.INFECTED

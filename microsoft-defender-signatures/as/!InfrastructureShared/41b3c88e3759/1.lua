-- Threat: !InfrastructureShared
-- Name: 41b3c88e3759
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if l_0_0 == nil or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED

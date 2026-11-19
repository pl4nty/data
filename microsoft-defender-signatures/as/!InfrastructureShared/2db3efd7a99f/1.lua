-- Threat: !InfrastructureShared
-- Name: 2db3efd7a99f
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if string.find(l_0_0, ":\\windows", 2, true) or string.find(l_0_1, ":\\windows", 2, true) then
  return mp.CLEAN
end
return mp.INFECTED

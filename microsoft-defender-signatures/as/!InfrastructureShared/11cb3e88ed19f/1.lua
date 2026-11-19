-- Threat: !InfrastructureShared
-- Name: 11cb3e88ed19f
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil then
  bm.add_related_file(mp.ContextualExpandEnvironmentVariables(l_0_0))
end
return mp.INFECTED

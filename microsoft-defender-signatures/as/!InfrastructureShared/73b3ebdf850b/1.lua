-- Threat: !InfrastructureShared
-- Name: 73b3ebdf850b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  bm.add_related_file(l_0_0)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].wp1 ~= nil then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
  bm.add_related_file(l_0_1)
end
return mp.INFECTED

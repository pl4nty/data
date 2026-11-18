-- Threat: !InfrastructureShared
-- Name: 83b3e4f2c9ca
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
  bm.add_related_file(l_0_0)
end
return mp.INFECTED

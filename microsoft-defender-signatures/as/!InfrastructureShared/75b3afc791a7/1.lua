-- Threat: !InfrastructureShared
-- Name: 75b3afc791a7
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
  bm.add_related_file(l_0_0)
end
return mp.INFECTED

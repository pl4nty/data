-- Threat: !InfrastructureShared
-- Name: 2db3c0f9a470
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  if l_0_0 ~= nil then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED

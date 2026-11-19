-- Threat: !InfrastructureShared
-- Name: 4db3361f1e27
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  if l_0_0 ~= nil then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED

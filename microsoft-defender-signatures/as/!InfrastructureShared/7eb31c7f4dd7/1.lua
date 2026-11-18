-- Threat: !InfrastructureShared
-- Name: 7eb31c7f4dd7
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN

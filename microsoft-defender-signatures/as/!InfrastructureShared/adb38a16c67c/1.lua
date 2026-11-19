-- Threat: !InfrastructureShared
-- Name: adb38a16c67c
-- Type: 21

if this_sigattrlog[4].matched then
  local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p1))
  if l_0_0 ~= nil then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED

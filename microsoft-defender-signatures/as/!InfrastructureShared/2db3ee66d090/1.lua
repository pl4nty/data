-- Threat: !InfrastructureShared
-- Name: 2db3ee66d090
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1))
  if l_0_0 ~= nil and string.find(l_0_0, "\\dism\\dismcore.dll", 1, true) then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
end
return mp.INFECTED

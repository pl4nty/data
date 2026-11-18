-- Threat: !InfrastructureShared
-- Name: 2db3584a4fba
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1))
  if l_0_0 ~= nil and string.find(l_0_0, "\\dismcore.dll$", 1, false) then
    return mp.INFECTED
  end
end
return mp.CLEAN

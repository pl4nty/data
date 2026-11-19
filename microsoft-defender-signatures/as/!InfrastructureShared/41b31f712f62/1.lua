-- Threat: !InfrastructureShared
-- Name: 41b31f712f62
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if l_0_0 ~= nil and l_0_0:find("system", 1, true) and l_0_0:find("security", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

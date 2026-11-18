-- Threat: !InfrastructureShared
-- Name: 63b34c11f1ce
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
  if l_0_0 ~= nil and l_0_1 ~= nil and l_0_2 ~= nil and string.find(l_0_1, l_0_0, 1, true) and string.find(l_0_2, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

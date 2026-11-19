-- Threat: !InfrastructureShared
-- Name: 161b3628c2904
-- Type: 21

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  local l_0_0
  l_0_0 = this_sigattrlog[6].utf8p2
  if this_sigattrlog[3].matched then
    local l_0_1 = this_sigattrlog[3].utf8p1
    if string.find(l_0_0, l_0_1, 1, true) then
      return mp.INFECTED
    end
  end
  if this_sigattrlog[4].matched then
    local l_0_2 = this_sigattrlog[4].utf8p1
    if string.find(l_0_0, l_0_2, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

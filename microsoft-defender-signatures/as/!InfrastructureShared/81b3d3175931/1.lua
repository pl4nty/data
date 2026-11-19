-- Threat: !InfrastructureShared
-- Name: 81b3d3175931
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p1)
end
if this_sigattrlog[5].matched and l_0_1 ~= nil then
  l_0_0 = this_sigattrlog[5]
  local l_0_2 = string.lower(l_0_0.utf8p1)
  if l_0_2 ~= nil and string.find(l_0_2, l_0_1, 1, true) then
    bm.add_related_file(l_0_1)
    return mp.INFECTED
  end
  local l_0_3 = string.lower(l_0_0.utf8p2)
  if string.find(l_0_3, l_0_1, 1, true) then
    bm.add_related_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN

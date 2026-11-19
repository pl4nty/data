-- Threat: !InfrastructureShared
-- Name: 91b39493907c
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched then
  l_0_4 = this_sigattrlog[1].utf8p2
  if l_0_4 ~= nil then
    l_0_0 = l_0_4
  end
end
if this_sigattrlog[2].matched then
  l_0_4 = this_sigattrlog[2].utf8p2
  if l_0_4 ~= nil then
    l_0_1 = l_0_4
  end
end
if this_sigattrlog[3].matched then
  l_0_4 = this_sigattrlog[3].utf8p2
  if l_0_4 ~= nil then
    l_0_2 = l_0_4
  end
end
if this_sigattrlog[4].matched then
  l_0_4 = this_sigattrlog[4].utf8p2
  if l_0_4 ~= nil then
    l_0_3 = l_0_4
  end
end
if l_0_2 ~= nil and l_0_3 ~= nil then
  local l_0_5 = l_0_2:match("([^ ]+)$")
  local l_0_6 = l_0_3:match("([^ ]+)$")
  if l_0_5 ~= nil and l_0_6 ~= nil and (string.find(l_0_0, l_0_5, 1, true) or string.find(l_0_1, l_0_5, 1, true)) and (string.find(l_0_0, l_0_6, 1, true) or string.find(l_0_1, l_0_6, 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN

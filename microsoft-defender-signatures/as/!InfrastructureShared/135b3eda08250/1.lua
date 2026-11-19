-- Threat: !InfrastructureShared
-- Name: 135b3eda08250
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p2
  if l_0_2 ~= nil then
    l_0_0 = l_0_2
  end
end
if this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p2
  if l_0_2 ~= nil then
    l_0_1 = l_0_2
  end
end
if l_0_1 ~= nil then
  local l_0_3 = l_0_1:match("([^ ]+)$")
  if l_0_3 ~= nil and string.find(l_0_0, l_0_3, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

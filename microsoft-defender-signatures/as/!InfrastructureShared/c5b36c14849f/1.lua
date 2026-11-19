-- Threat: !InfrastructureShared
-- Name: c5b36c14849f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].wp1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].wp1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].wp1
end
l_0_0 = string.match(l_0_0, "\\(%w+%.%w+)$")
if l_0_0 == nil then
  return mp.CLEAN
end
if this_sigattrlog[4].matched then
  local l_0_1 = this_sigattrlog[4].utf8p2
  local l_0_2, l_0_3 = string.find(l_0_1, ".bat", 1, true)
  if l_0_3 and string.find(l_0_1, l_0_0, l_0_3 + 1, true) then
    return mp.INFECTED
  end
elseif this_sigattrlog[5].matched then
  local l_0_4 = this_sigattrlog[5].utf8p2
  if string.find(l_0_4, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

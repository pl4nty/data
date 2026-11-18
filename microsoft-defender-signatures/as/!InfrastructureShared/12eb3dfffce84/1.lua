-- Threat: !InfrastructureShared
-- Name: 12eb3dfffce84
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].wp1
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].wp1
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].wp1
elseif this_sigattrlog[5].matched then
  l_0_2 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_1 ~= nil then
  l_0_0 = string.lower(mp.utf16to8(l_0_1))
  if string.find(l_0_0, "\\ms%l+%.exe:%d+$") then
    return mp.INFECTED
  end
elseif l_0_2 ~= nil and string.find(l_0_2, "\\windows\\\\%d+$") then
  return mp.INFECTED
end
return mp.CLEAN

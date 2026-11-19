-- Threat: !InfrastructureShared
-- Name: 2db3506f116b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = mp.utf16to8(this_sigattrlog[2].wp1)
end
if this_sigattrlog[1].matched and this_sigattrlog[1].wp1 ~= nil then
  l_0_1 = mp.utf16to8(this_sigattrlog[1].wp1)
end
if l_0_0 ~= nil and l_0_1 ~= nil and string.find(l_0_1, l_0_0, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

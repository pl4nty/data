-- Threat: !InfrastructureShared
-- Name: 2db3669a4946
-- Type: 21

local l_0_0, l_0_1
l_0_0 = string.lower(mp.utf16to8(this_sigattrlog[1].wp1))
l_0_1 = string.lower(mp.utf16to8(this_sigattrlog[2].wp1))
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_0 == l_0_1 then
  if string.find(l_0_0, "c:\\windows\\system32\\", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

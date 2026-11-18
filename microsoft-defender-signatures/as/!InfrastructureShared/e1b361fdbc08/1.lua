-- Threat: !InfrastructureShared
-- Name: e1b361fdbc08
-- Type: 21

local l_0_0 = string.match(mp.utf16to8(this_sigattrlog[1].wp1), "\\%l%l%l%l%l%l%l%l.exe")
if l_0_0 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 34b331b62080
-- Type: 21

local l_0_0 = string.match(this_sigattrlog[1].utf8p1, "\\%l%l%l%l%l%l%d%.exe")
if l_0_0 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

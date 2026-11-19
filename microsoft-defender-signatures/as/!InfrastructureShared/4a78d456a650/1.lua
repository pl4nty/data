-- Threat: !InfrastructureShared
-- Name: 4a78d456a650
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 1000000 and 500000 <= l_0_0 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

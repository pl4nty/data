-- Threat: !InfrastructureShared
-- Name: bf78af9ebac0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 196608 < l_0_0 and l_0_0 < 393216 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: ef61834ab511
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 5376 and 4096 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

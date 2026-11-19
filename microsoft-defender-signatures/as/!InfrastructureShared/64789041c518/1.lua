-- Threat: !InfrastructureShared
-- Name: 64789041c518
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 196608 < l_0_0 and l_0_0 < 262144 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 95615cc7890f
-- Type: 21

local l_0_0 = mp.getfilesize()
if 278016 <= l_0_0 and l_0_0 <= 1125414 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

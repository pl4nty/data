-- Threat: !InfrastructureShared
-- Name: 4c78e1f9c38b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 65536 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

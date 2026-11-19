-- Threat: !InfrastructureShared
-- Name: a97841cac482
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 282624 < l_0_0 and l_0_0 < 286720 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1c8615388cfe9
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and peattributes.isdll and l_0_0 < 786432 then
  return mp.INFECTED
end
return mp.CLEAN

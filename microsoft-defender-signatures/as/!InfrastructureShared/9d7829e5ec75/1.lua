-- Threat: !InfrastructureShared
-- Name: 9d7829e5ec75
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and l_0_0 < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN

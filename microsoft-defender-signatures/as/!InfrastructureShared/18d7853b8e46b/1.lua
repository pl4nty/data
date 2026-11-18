-- Threat: !InfrastructureShared
-- Name: 18d7853b8e46b
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isvbnative and peattributes.no_security and 806912 < l_0_0 and l_0_0 < 1007616 then
  return mp.INFECTED
end
return mp.CLEAN

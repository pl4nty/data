-- Threat: !InfrastructureShared
-- Name: 4c78a733f78c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 983040 and 786432 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

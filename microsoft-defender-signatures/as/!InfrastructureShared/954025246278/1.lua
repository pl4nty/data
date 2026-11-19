-- Threat: !InfrastructureShared
-- Name: 954025246278
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 4096 <= l_0_0 and l_0_0 <= 24576 then
  return mp.INFECTED
end
return mp.CLEAN

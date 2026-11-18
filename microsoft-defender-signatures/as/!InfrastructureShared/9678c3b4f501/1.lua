-- Threat: !InfrastructureShared
-- Name: 9678c3b4f501
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 32768 <= l_0_0 and l_0_0 <= 655360 then
  return mp.INFECTED
end
return mp.CLEAN

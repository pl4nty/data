-- Threat: !InfrastructureShared
-- Name: 4d61dc1f5da0
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 49152 and 36864 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

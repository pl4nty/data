-- Threat: !InfrastructureShared
-- Name: 7461de35a7f1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10485760 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

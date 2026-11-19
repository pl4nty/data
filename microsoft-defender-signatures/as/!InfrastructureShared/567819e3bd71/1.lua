-- Threat: !InfrastructureShared
-- Name: 567819e3bd71
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 % 4096 == 0 and 143360 <= l_0_0 and l_0_0 <= 155648 then
  return mp.INFECTED
end
return mp.CLEAN

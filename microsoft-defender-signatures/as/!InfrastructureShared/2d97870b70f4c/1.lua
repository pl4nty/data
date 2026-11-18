-- Threat: !InfrastructureShared
-- Name: 2d97870b70f4c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 5120000 then
  return mp.INFECTED
end
return mp.CLEAN

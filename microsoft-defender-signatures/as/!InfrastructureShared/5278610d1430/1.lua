-- Threat: !InfrastructureShared
-- Name: 5278610d1430
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 20480 then
  return mp.INFECTED
end
return mp.CLEAN

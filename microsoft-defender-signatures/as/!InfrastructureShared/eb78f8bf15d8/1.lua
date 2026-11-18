-- Threat: !InfrastructureShared
-- Name: eb78f8bf15d8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 1388544 < l_0_0 and l_0_0 < 1396736 then
  return mp.INFECTED
end
return mp.CLEAN

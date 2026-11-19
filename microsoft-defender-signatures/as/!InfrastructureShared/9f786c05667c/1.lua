-- Threat: !InfrastructureShared
-- Name: 9f786c05667c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 512000 then
  return mp.INFECTED
end
return mp.CLEAN

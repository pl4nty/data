-- Threat: !InfrastructureShared
-- Name: ee78bd856600
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 851968 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

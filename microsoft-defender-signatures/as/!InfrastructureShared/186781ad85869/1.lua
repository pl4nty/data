-- Threat: !InfrastructureShared
-- Name: 186781ad85869
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 51200 then
  return mp.INFECTED
end
return mp.CLEAN

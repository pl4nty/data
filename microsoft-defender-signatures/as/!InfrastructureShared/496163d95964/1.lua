-- Threat: !InfrastructureShared
-- Name: 496163d95964
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 983040 then
  return mp.INFECTED
end
return mp.CLEAN

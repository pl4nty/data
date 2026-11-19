-- Threat: !InfrastructureShared
-- Name: 30615814a0f4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 <= 1572864 then
  return mp.INFECTED
end
return mp.CLEAN

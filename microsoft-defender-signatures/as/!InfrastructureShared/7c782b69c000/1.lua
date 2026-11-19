-- Threat: !InfrastructureShared
-- Name: 7c782b69c000
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 4096 <= l_0_0 and l_0_0 <= 20480 then
  return mp.INFECTED
end
return mp.CLEAN

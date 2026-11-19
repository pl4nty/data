-- Threat: !InfrastructureShared
-- Name: 1077863669859
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 4096 <= l_0_0 and l_0_0 <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN

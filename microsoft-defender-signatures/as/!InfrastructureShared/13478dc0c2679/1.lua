-- Threat: !InfrastructureShared
-- Name: 13478dc0c2679
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 131072 < l_0_0 and l_0_0 < 262144 then
  return mp.INFECTED
end
return mp.CLEAN

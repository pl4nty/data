-- Threat: !InfrastructureShared
-- Name: 11d6146d92a94
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 5376 < l_0_0 and l_0_0 < 12288 then
  return mp.INFECTED
end
return mp.CLEAN

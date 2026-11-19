-- Threat: !InfrastructureShared
-- Name: 4661a2268b06
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 655360 < l_0_0 and l_0_0 < 786432 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: b478c4c50e8d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 53248 < l_0_0 and l_0_0 < 65536 then
  return mp.INFECTED
end
return mp.CLEAN

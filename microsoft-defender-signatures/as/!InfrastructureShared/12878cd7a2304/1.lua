-- Threat: !InfrastructureShared
-- Name: 12878cd7a2304
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil and l_0_0 < 16384 and 2000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

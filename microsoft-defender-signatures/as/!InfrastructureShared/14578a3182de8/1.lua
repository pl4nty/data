-- Threat: !InfrastructureShared
-- Name: 14578a3182de8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN

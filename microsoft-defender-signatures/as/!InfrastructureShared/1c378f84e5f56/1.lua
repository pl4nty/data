-- Threat: !InfrastructureShared
-- Name: 1c378f84e5f56
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1257874624b15
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED

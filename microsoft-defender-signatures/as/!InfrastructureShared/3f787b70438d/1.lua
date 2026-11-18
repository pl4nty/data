-- Threat: !InfrastructureShared
-- Name: 3f787b70438d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 300000 < l_0_0 and l_0_0 < 500000 then
  return mp.INFECTED
end
return mp.CLEAN

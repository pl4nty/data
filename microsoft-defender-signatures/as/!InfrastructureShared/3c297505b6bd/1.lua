-- Threat: !InfrastructureShared
-- Name: 3c297505b6bd
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1000 < l_0_0 and l_0_0 < 30000 then
  return mp.INFECTED
end
return mp.CLEAN

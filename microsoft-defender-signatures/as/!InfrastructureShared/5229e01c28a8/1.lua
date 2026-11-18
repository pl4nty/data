-- Threat: !InfrastructureShared
-- Name: 5229e01c28a8
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 500 then
  return mp.INFECTED
end
return mp.CLEAN

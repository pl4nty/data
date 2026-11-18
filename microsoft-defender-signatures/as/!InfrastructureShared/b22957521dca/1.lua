-- Threat: !InfrastructureShared
-- Name: b22957521dca
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.INFECTED
end
return mp.CLEAN

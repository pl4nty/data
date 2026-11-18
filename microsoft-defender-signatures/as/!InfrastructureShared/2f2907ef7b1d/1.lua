-- Threat: !InfrastructureShared
-- Name: 2f2907ef7b1d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.INFECTED
end
return mp.CLEAN

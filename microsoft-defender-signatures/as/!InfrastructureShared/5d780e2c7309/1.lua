-- Threat: !InfrastructureShared
-- Name: 5d780e2c7309
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3500000 < l_0_0 and l_0_0 < 4500000 then
  return mp.INFECTED
end
return mp.CLEAN

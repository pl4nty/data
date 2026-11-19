-- Threat: !InfrastructureShared
-- Name: 6a8c7beec316
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 7000000 then
  return mp.INFECTED
end
return mp.CLEAN

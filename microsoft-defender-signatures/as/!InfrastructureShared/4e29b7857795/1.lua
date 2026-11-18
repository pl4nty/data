-- Threat: !InfrastructureShared
-- Name: 4e29b7857795
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 6200 then
  return mp.INFECTED
end
return mp.CLEAN

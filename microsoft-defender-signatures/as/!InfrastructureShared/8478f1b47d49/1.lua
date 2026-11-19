-- Threat: !InfrastructureShared
-- Name: 8478f1b47d49
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 25000000 and 3000000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 37290436d2b6
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1000 then
  return mp.INFECTED
end
return mp.CLEAN

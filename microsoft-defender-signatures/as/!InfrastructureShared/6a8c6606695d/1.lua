-- Threat: !InfrastructureShared
-- Name: 6a8c6606695d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 25000 then
  return mp.INFECTED
end
return mp.CLEAN

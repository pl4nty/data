-- Threat: !InfrastructureShared
-- Name: 292963a98405
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1500 then
  return mp.INFECTED
end
return mp.CLEAN

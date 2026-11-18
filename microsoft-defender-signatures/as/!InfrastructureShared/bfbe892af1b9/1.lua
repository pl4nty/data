-- Threat: !InfrastructureShared
-- Name: bfbe892af1b9
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5500 then
  return mp.INFECTED
end
return mp.CLEAN

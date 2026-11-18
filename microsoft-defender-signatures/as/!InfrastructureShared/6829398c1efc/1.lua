-- Threat: !InfrastructureShared
-- Name: 6829398c1efc
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1000 then
  return mp.INFECTED
end
return mp.CLEAN

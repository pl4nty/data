-- Threat: !InfrastructureShared
-- Name: a578c4c16b49
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3072000 then
  return mp.INFECTED
end
return mp.CLEAN

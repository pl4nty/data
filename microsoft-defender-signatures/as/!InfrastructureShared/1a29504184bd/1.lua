-- Threat: !InfrastructureShared
-- Name: 1a29504184bd
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 then
  return mp.INFECTED
end
return mp.CLEAN

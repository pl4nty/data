-- Threat: !InfrastructureShared
-- Name: 88be6141a8a5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 6500 then
  return mp.INFECTED
end
return mp.CLEAN

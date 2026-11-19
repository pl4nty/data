-- Threat: !InfrastructureShared
-- Name: 57298312fb9e
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 200 then
  return mp.INFECTED
end
return mp.CLEAN

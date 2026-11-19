-- Threat: !InfrastructureShared
-- Name: 6b2961ab4b62
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 200 then
  return mp.INFECTED
end
return mp.CLEAN

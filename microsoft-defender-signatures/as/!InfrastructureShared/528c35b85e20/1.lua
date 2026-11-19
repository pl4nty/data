-- Threat: !InfrastructureShared
-- Name: 528c35b85e20
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 150000 then
  return mp.INFECTED
end
return mp.CLEAN

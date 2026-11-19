-- Threat: !InfrastructureShared
-- Name: 532913fe585b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 200 then
  return mp.INFECTED
end
return mp.CLEAN

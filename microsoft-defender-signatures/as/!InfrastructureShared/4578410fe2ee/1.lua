-- Threat: !InfrastructureShared
-- Name: 4578410fe2ee
-- Type: 21

local l_0_0 = mp.getfilesize()
if 120000 < l_0_0 and l_0_0 < 140000 then
  return mp.INFECTED
end
return mp.CLEAN

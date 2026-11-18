-- Threat: !InfrastructureShared
-- Name: 59be1678b06f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 650000 then
  return mp.INFECTED
end
return mp.CLEAN

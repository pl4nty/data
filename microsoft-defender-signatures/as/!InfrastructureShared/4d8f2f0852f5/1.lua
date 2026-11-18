-- Threat: !InfrastructureShared
-- Name: 4d8f2f0852f5
-- Type: 21

local l_0_0 = mp.getfilesize()
if 12000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

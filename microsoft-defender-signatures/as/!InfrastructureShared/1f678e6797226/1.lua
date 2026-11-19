-- Threat: !InfrastructureShared
-- Name: 1f678e6797226
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5000000 < l_0_0 or l_0_0 < 1000 then
  return mp.CLEAN
end
return mp.INFECTED

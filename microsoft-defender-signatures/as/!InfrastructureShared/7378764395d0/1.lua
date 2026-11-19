-- Threat: !InfrastructureShared
-- Name: 7378764395d0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 300000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED

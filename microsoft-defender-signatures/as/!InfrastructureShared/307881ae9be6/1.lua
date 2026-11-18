-- Threat: !InfrastructureShared
-- Name: 307881ae9be6
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10240000 < l_0_0 then
  return mp.CLEAN
end
if pehdr.Subsystem == 11 or pehdr.Subsystem == 12 then
  return mp.INFECTED
end
return mp.CLEAN

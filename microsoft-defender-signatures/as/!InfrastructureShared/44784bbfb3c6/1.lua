-- Threat: !InfrastructureShared
-- Name: 44784bbfb3c6
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN

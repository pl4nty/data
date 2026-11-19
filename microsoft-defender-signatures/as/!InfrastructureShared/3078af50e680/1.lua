-- Threat: !InfrastructureShared
-- Name: 3078af50e680
-- Type: 21

if mp.getfilesize() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN

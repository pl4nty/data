-- Threat: !InfrastructureShared
-- Name: 5729ee3aa946
-- Type: 21

if mp.getfilesize() <= 2048 and mp.getfilesize() >= 400 then
  return mp.INFECTED
end
return mp.CLEAN

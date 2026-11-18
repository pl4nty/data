-- Threat: !InfrastructureShared
-- Name: 132782c160163
-- Type: 21

if mp.getfilesize() < 550912 then
  return mp.INFECTED
end
return mp.CLEAN

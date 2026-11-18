-- Threat: !InfrastructureShared
-- Name: 6378579d953a
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN

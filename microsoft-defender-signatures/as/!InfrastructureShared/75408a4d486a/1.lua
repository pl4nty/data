-- Threat: !InfrastructureShared
-- Name: 75408a4d486a
-- Type: 21

if mp.getfilesize() > 750000 then
  return mp.CLEAN
end
return mp.INFECTED

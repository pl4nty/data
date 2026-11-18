-- Threat: !InfrastructureShared
-- Name: 2388fb67abdbf
-- Type: 21

if mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN

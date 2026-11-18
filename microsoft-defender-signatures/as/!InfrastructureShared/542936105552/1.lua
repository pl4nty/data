-- Threat: !InfrastructureShared
-- Name: 542936105552
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 292951aaf4d3
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN

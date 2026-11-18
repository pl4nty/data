-- Threat: !InfrastructureShared
-- Name: 81d3243a34b8
-- Type: 21

if mp.getfilesize() < 850000 then
  return mp.INFECTED
end
return mp.CLEAN

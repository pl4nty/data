-- Threat: !InfrastructureShared
-- Name: eb782443779b
-- Type: 21

if mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN

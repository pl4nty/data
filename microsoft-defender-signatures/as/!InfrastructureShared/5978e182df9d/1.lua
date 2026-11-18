-- Threat: !InfrastructureShared
-- Name: 5978e182df9d
-- Type: 21

if mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN

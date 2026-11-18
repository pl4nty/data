-- Threat: !InfrastructureShared
-- Name: 3bd7b36e1b0b
-- Type: 21

if versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.LOWFI

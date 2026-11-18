-- Threat: !InfrastructureShared
-- Name: dfd7b5c35cdb
-- Type: 21

if versioning.IsSeville() and versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.LOWFI

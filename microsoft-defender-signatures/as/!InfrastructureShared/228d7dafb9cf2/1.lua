-- Threat: !InfrastructureShared
-- Name: 228d7dafb9cf2
-- Type: 21

if versioning.IsSeville() and versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.LOWFI

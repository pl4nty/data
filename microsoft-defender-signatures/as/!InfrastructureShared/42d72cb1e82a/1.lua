-- Threat: !InfrastructureShared
-- Name: 42d72cb1e82a
-- Type: 21

if versioning.IsSeville() then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 14ed7bfc0ad91
-- Type: 21

if versioning.IsSeville() or versioning.IsServer() then
  return mp.INFECTED
end
return mp.LOWFI

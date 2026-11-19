-- Threat: !InfrastructureShared
-- Name: f8d738ddda03
-- Type: 21

if versioning.IsSeville() or versioning.IsServer() then
  return mp.INFECTED
end
return mp.LOWFI

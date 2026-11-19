-- Threat: !InfrastructureShared
-- Name: 84781846be03
-- Type: 21

if mp.get_mpattribute("SIGATTR:HostModify") then
  return mp.INFECTED
end
return mp.LOWFI

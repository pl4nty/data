-- Threat: !InfrastructureShared
-- Name: c578bbf3edee
-- Type: 21

if mp.get_mpattribute("SIGATTR:Umbex") then
  return mp.INFECTED
end
return mp.CLEAN

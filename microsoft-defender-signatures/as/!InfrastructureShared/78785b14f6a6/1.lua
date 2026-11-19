-- Threat: !InfrastructureShared
-- Name: 78785b14f6a6
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

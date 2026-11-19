-- Threat: !InfrastructureShared
-- Name: d9414e48f5b4
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

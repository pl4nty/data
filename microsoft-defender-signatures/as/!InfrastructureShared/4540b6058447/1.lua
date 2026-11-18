-- Threat: !InfrastructureShared
-- Name: 4540b6058447
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.LOWFI

-- Threat: !InfrastructureShared
-- Name: 4e789675bd9b
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

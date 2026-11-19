-- Threat: !InfrastructureShared
-- Name: 4540d6681be2
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

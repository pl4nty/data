-- Threat: !InfrastructureShared
-- Name: 854051577cce
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

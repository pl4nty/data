-- Threat: !InfrastructureShared
-- Name: c941965ced34
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

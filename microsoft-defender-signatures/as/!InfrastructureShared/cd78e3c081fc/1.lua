-- Threat: !InfrastructureShared
-- Name: cd78e3c081fc
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 112784afd4b88
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: a778808c58e6
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

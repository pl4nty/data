-- Threat: !InfrastructureShared
-- Name: 58789143fa5f
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

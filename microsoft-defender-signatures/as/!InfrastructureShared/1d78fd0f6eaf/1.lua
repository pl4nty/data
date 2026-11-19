-- Threat: !InfrastructureShared
-- Name: 1d78fd0f6eaf
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

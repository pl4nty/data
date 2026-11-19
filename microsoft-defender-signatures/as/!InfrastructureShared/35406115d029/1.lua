-- Threat: !InfrastructureShared
-- Name: 35406115d029
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

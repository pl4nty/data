-- Threat: !InfrastructureShared
-- Name: 14b78334bce25
-- Type: 21

if not mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.CLEAN
end
return mp.INFECTED

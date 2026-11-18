-- Threat: !InfrastructureShared
-- Name: 4061d4b7dcf8
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

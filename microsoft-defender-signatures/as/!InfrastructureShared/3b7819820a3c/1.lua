-- Threat: !InfrastructureShared
-- Name: 3b7819820a3c
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

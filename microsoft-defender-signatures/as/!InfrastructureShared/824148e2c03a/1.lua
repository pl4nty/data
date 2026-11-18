-- Threat: !InfrastructureShared
-- Name: 824148e2c03a
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

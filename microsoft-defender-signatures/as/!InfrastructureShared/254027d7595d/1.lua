-- Threat: !InfrastructureShared
-- Name: 254027d7595d
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

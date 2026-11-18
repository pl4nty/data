-- Threat: !InfrastructureShared
-- Name: 3841028efb43
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

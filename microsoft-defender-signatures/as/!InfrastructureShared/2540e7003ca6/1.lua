-- Threat: !InfrastructureShared
-- Name: 2540e7003ca6
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

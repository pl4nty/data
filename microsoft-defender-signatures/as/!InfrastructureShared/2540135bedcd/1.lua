-- Threat: !InfrastructureShared
-- Name: 2540135bedcd
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.LOWFI
end
return mp.CLEAN

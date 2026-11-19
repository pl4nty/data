-- Threat: !InfrastructureShared
-- Name: 3141537a342d
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

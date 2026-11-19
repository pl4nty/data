-- Threat: !InfrastructureShared
-- Name: 6041ed45ff49
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

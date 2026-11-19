-- Threat: !InfrastructureShared
-- Name: c478098c43ad
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

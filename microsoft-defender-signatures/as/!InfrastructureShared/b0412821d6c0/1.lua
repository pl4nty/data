-- Threat: !InfrastructureShared
-- Name: b0412821d6c0
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

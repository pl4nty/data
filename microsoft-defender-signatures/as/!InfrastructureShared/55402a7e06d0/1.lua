-- Threat: !InfrastructureShared
-- Name: 55402a7e06d0
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN

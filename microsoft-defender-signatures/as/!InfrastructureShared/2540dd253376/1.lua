-- Threat: !InfrastructureShared
-- Name: 2540dd253376
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

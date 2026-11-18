-- Threat: !InfrastructureShared
-- Name: 74782b36534d
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

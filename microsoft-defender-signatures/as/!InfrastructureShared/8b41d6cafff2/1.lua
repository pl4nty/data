-- Threat: !InfrastructureShared
-- Name: 8b41d6cafff2
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

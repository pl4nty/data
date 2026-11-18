-- Threat: !InfrastructureShared
-- Name: 45407118bb8b
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

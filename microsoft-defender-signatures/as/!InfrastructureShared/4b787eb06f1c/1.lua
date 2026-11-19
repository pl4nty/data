-- Threat: !InfrastructureShared
-- Name: 4b787eb06f1c
-- Type: 21

if peattributes.isdll and mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: af4138b98517
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 35401e73620f
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

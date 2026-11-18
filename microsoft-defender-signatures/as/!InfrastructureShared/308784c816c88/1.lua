-- Threat: !InfrastructureShared
-- Name: 308784c816c88
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.LOWFI

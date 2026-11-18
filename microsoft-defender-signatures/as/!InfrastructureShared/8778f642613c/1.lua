-- Threat: !InfrastructureShared
-- Name: 8778f642613c
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.LOWFI

-- Threat: !InfrastructureShared
-- Name: 534134b77a32
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

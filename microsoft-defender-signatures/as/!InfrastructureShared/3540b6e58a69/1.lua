-- Threat: !InfrastructureShared
-- Name: 3540b6e58a69
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

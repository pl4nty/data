-- Threat: !InfrastructureShared
-- Name: 3540b8c9eb22
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

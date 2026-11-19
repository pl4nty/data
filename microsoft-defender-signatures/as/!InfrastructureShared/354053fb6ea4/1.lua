-- Threat: !InfrastructureShared
-- Name: 354053fb6ea4
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

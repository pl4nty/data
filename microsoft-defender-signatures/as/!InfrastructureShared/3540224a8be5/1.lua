-- Threat: !InfrastructureShared
-- Name: 3540224a8be5
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

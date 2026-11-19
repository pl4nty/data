-- Threat: !InfrastructureShared
-- Name: 53415dfa032e
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

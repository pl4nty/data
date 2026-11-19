-- Threat: !InfrastructureShared
-- Name: 7c78d7a57431
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN

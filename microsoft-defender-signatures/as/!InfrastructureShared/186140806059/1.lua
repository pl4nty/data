-- Threat: !InfrastructureShared
-- Name: 186140806059
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

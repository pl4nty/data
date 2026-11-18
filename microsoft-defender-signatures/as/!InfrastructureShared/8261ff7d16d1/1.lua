-- Threat: !InfrastructureShared
-- Name: 8261ff7d16d1
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

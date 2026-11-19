-- Threat: !InfrastructureShared
-- Name: 84783d7c80a1
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

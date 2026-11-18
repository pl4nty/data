-- Threat: !InfrastructureShared
-- Name: 7c78d44007ce
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

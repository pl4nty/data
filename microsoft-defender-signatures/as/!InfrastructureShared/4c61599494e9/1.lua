-- Threat: !InfrastructureShared
-- Name: 4c61599494e9
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

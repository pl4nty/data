-- Threat: !InfrastructureShared
-- Name: e67862ae8f1d
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

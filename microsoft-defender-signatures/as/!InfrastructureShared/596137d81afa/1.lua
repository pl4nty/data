-- Threat: !InfrastructureShared
-- Name: 596137d81afa
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

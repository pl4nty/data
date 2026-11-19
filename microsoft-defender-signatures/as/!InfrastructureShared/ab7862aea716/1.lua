-- Threat: !InfrastructureShared
-- Name: ab7862aea716
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

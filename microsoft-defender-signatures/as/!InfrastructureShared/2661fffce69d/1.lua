-- Threat: !InfrastructureShared
-- Name: 2661fffce69d
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 3c78aa13a5b0
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

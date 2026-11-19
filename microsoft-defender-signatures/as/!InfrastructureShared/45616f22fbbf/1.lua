-- Threat: !InfrastructureShared
-- Name: 45616f22fbbf
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

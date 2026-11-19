-- Threat: !InfrastructureShared
-- Name: 12d7813f6107b
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 17661a1dd332c
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

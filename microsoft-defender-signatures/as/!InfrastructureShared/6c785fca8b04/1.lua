-- Threat: !InfrastructureShared
-- Name: 6c785fca8b04
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

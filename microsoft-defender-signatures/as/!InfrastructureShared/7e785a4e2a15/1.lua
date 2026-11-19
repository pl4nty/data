-- Threat: !InfrastructureShared
-- Name: 7e785a4e2a15
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

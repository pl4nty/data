-- Threat: !InfrastructureShared
-- Name: 3540777bdc5e
-- Type: 21

if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

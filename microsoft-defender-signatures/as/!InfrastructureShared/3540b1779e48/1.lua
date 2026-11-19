-- Threat: !InfrastructureShared
-- Name: 3540b1779e48
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

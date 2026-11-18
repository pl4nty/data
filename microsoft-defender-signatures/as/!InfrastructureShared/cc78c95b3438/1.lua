-- Threat: !InfrastructureShared
-- Name: cc78c95b3438
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

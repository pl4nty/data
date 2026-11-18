-- Threat: !InfrastructureShared
-- Name: 327843d4102f
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

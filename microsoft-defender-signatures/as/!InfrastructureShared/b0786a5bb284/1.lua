-- Threat: !InfrastructureShared
-- Name: b0786a5bb284
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

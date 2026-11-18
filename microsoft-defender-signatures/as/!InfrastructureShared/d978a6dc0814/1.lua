-- Threat: !InfrastructureShared
-- Name: d978a6dc0814
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

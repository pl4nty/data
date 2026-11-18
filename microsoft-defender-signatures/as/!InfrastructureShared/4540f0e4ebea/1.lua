-- Threat: !InfrastructureShared
-- Name: 4540f0e4ebea
-- Type: 21

if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

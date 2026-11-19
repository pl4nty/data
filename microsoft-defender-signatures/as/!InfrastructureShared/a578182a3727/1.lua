-- Threat: !InfrastructureShared
-- Name: a578182a3727
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED

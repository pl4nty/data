-- Threat: !InfrastructureShared
-- Name: 5c61e6dba3f4
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

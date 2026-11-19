-- Threat: !InfrastructureShared
-- Name: 7061e28c41fd
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN

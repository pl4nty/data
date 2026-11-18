-- Threat: !InfrastructureShared
-- Name: 5b78c7a10477
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

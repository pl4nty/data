-- Threat: !InfrastructureShared
-- Name: 2878567a0ba9
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

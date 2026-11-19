-- Threat: !InfrastructureShared
-- Name: 12178d94cc949
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

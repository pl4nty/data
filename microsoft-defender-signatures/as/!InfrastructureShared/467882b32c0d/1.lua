-- Threat: !InfrastructureShared
-- Name: 467882b32c0d
-- Type: 21

if mp.get_mpattribute("pea_isdll") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

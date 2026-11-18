-- Threat: !InfrastructureShared
-- Name: 9b78bfcbe8df
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll == true and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN

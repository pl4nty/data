-- Threat: !InfrastructureShared
-- Name: 9b7866506827
-- Type: 21

if mp.get_mpattribute("pea_isdll") and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN

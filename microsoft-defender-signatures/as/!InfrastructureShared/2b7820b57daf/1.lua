-- Threat: !InfrastructureShared
-- Name: 2b7820b57daf
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 70 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

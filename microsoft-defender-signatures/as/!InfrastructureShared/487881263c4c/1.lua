-- Threat: !InfrastructureShared
-- Name: 487881263c4c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and pe.get_exports_count() == 1 then
  return mp.INFECTED
end
return mp.CLEAN

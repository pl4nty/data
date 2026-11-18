-- Threat: !InfrastructureShared
-- Name: 38782cc08b6a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and pe.get_exports_count() >= 20 then
  return mp.INFECTED
end
return mp.CLEAN

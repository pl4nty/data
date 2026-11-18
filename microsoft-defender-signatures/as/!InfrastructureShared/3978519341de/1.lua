-- Threat: !InfrastructureShared
-- Name: 3978519341de
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and pe.get_exports_count() >= 20 then
  return mp.INFECTED
end
return mp.CLEAN

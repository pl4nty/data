-- Threat: !InfrastructureShared
-- Name: 3d78d6dc55a5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and pe.get_exports_count() >= 10 then
  return mp.INFECTED
end
return mp.CLEAN

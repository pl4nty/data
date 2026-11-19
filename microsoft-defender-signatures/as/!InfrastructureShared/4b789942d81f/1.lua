-- Threat: !InfrastructureShared
-- Name: 4b789942d81f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true and pe.get_exports_count() >= 20 and pesecs[10].Name == ".tls" then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7678f065e538
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and pe.get_exports_count() == 19 then
  return mp.INFECTED
end
return mp.CLEAN

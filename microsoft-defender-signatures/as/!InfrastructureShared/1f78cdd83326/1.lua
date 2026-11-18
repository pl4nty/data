-- Threat: !InfrastructureShared
-- Name: 1f78cdd83326
-- Type: 21

if peattributes.isexe == true and peattributes.no_boundimport == true and peattributes.no_exports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

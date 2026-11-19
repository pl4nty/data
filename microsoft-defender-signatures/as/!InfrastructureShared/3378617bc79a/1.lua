-- Threat: !InfrastructureShared
-- Name: 3378617bc79a
-- Type: 21

if peattributes.isexe == true and peattributes.no_boundimport == true and peattributes.no_exports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

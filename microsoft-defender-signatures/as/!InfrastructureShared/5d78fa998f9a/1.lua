-- Threat: !InfrastructureShared
-- Name: 5d78fa998f9a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

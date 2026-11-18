-- Threat: !InfrastructureShared
-- Name: 18078c9970b68
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

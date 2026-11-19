-- Threat: !InfrastructureShared
-- Name: 6678cb59cb17
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

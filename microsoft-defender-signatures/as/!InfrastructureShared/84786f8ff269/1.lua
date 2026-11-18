-- Threat: !InfrastructureShared
-- Name: 84786f8ff269
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 77786d340393
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

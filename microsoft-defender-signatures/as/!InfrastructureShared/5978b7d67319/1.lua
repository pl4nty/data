-- Threat: !InfrastructureShared
-- Name: 5978b7d67319
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

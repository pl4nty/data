-- Threat: !InfrastructureShared
-- Name: 4c78879eaed5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

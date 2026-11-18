-- Threat: !InfrastructureShared
-- Name: 4278281d010c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

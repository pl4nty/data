-- Threat: !InfrastructureShared
-- Name: 7278c43f90c1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

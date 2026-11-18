-- Threat: !InfrastructureShared
-- Name: 93780e0b3035
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

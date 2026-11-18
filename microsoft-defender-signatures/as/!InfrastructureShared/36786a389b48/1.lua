-- Threat: !InfrastructureShared
-- Name: 36786a389b48
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

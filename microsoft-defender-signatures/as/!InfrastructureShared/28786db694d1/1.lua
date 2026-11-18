-- Threat: !InfrastructureShared
-- Name: 28786db694d1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

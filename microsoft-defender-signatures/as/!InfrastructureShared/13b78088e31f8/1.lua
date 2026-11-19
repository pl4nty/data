-- Threat: !InfrastructureShared
-- Name: 13b78088e31f8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

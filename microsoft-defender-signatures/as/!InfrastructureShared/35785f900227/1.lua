-- Threat: !InfrastructureShared
-- Name: 35785f900227
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

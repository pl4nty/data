-- Threat: !InfrastructureShared
-- Name: 3178f3d05fd5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 4c7839515e8d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

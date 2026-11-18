-- Threat: !InfrastructureShared
-- Name: 2d78ae901947
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

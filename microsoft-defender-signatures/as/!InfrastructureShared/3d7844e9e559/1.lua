-- Threat: !InfrastructureShared
-- Name: 3d7844e9e559
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

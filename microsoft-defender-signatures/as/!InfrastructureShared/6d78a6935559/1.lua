-- Threat: !InfrastructureShared
-- Name: 6d78a6935559
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

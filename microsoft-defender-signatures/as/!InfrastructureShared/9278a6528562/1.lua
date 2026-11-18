-- Threat: !InfrastructureShared
-- Name: 9278a6528562
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

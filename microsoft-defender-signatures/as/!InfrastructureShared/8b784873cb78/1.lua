-- Threat: !InfrastructureShared
-- Name: 8b784873cb78
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

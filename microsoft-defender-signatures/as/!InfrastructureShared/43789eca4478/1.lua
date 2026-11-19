-- Threat: !InfrastructureShared
-- Name: 43789eca4478
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

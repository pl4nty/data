-- Threat: !InfrastructureShared
-- Name: 4e78002cb01d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 9f78464cf01f
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

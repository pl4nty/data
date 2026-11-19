-- Threat: !InfrastructureShared
-- Name: 9e78d3fdc29c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

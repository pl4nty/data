-- Threat: !InfrastructureShared
-- Name: 4f784db2ca18
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

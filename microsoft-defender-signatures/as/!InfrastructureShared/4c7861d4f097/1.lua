-- Threat: !InfrastructureShared
-- Name: 4c7861d4f097
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

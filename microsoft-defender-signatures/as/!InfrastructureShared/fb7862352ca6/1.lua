-- Threat: !InfrastructureShared
-- Name: fb7862352ca6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

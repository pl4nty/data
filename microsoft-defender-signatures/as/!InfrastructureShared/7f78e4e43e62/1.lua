-- Threat: !InfrastructureShared
-- Name: 7f78e4e43e62
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

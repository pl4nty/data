-- Threat: !InfrastructureShared
-- Name: 3878e1206108
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1a17817af9d60
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

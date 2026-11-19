-- Threat: !InfrastructureShared
-- Name: 3778835fdeec
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

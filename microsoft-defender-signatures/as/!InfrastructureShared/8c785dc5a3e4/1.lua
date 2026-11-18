-- Threat: !InfrastructureShared
-- Name: 8c785dc5a3e4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

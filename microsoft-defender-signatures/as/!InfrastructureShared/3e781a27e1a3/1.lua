-- Threat: !InfrastructureShared
-- Name: 3e781a27e1a3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

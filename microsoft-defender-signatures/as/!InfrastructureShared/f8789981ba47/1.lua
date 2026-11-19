-- Threat: !InfrastructureShared
-- Name: f8789981ba47
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

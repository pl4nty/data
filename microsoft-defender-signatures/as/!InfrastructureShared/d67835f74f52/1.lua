-- Threat: !InfrastructureShared
-- Name: d67835f74f52
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

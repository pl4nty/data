-- Threat: !InfrastructureShared
-- Name: 3a78b4434f2a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: b278b5ed1192
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

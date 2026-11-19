-- Threat: !InfrastructureShared
-- Name: 5d788087b340
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

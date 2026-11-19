-- Threat: !InfrastructureShared
-- Name: 3678d0cf777b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

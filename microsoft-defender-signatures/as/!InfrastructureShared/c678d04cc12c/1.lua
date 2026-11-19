-- Threat: !InfrastructureShared
-- Name: c678d04cc12c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

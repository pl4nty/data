-- Threat: !InfrastructureShared
-- Name: 307896ff8560
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

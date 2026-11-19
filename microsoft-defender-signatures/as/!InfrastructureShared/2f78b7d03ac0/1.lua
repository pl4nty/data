-- Threat: !InfrastructureShared
-- Name: 2f78b7d03ac0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

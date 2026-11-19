-- Threat: !InfrastructureShared
-- Name: fc78ac0b6de2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

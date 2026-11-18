-- Threat: !InfrastructureShared
-- Name: 5678a0df685c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

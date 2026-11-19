-- Threat: !InfrastructureShared
-- Name: 4678802a2a2a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

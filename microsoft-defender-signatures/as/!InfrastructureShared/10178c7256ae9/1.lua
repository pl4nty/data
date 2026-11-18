-- Threat: !InfrastructureShared
-- Name: 10178c7256ae9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

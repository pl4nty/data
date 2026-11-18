-- Threat: !InfrastructureShared
-- Name: 59782fc513dc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

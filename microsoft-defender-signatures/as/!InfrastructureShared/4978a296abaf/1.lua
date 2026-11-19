-- Threat: !InfrastructureShared
-- Name: 4978a296abaf
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 8878eb288c0a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

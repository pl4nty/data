-- Threat: !InfrastructureShared
-- Name: 377879fc0aec
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

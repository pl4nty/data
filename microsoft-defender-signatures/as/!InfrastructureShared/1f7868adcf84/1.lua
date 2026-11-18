-- Threat: !InfrastructureShared
-- Name: 1f7868adcf84
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 3978d8ad3122
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 327840a4d98b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

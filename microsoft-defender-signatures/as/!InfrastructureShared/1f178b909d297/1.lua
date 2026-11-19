-- Threat: !InfrastructureShared
-- Name: 1f178b909d297
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

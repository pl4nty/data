-- Threat: !InfrastructureShared
-- Name: 8c78325bbfb0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 657870a40ccb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

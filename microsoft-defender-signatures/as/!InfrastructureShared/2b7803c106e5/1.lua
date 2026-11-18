-- Threat: !InfrastructureShared
-- Name: 2b7803c106e5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

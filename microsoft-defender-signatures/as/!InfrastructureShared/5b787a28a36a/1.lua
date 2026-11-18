-- Threat: !InfrastructureShared
-- Name: 5b787a28a36a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

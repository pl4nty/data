-- Threat: !InfrastructureShared
-- Name: 3b788b5532f2
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

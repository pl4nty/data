-- Threat: !InfrastructureShared
-- Name: 7c78b14df338
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

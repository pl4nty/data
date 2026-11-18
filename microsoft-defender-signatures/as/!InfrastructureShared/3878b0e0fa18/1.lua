-- Threat: !InfrastructureShared
-- Name: 3878b0e0fa18
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

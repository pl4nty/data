-- Threat: !InfrastructureShared
-- Name: 8378d89ff0e7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 38787ed479f3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

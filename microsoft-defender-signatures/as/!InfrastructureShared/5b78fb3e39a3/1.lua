-- Threat: !InfrastructureShared
-- Name: 5b78fb3e39a3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

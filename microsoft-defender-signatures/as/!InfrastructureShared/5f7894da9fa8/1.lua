-- Threat: !InfrastructureShared
-- Name: 5f7894da9fa8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

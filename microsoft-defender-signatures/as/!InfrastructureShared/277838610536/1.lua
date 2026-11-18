-- Threat: !InfrastructureShared
-- Name: 277838610536
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

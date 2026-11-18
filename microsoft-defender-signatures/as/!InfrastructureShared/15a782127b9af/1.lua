-- Threat: !InfrastructureShared
-- Name: 15a782127b9af
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: bc78ad247a4a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

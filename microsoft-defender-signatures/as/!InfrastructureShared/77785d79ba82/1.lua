-- Threat: !InfrastructureShared
-- Name: 77785d79ba82
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 3a784dece90d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

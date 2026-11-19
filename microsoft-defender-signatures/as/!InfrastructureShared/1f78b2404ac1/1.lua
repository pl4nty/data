-- Threat: !InfrastructureShared
-- Name: 1f78b2404ac1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: f478c5326501
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1e7875bb4830
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

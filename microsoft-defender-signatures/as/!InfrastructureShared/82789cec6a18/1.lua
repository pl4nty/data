-- Threat: !InfrastructureShared
-- Name: 82789cec6a18
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

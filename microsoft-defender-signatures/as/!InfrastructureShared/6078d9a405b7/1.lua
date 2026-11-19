-- Threat: !InfrastructureShared
-- Name: 6078d9a405b7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

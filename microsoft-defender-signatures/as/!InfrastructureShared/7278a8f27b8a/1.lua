-- Threat: !InfrastructureShared
-- Name: 7278a8f27b8a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

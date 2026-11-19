-- Threat: !InfrastructureShared
-- Name: 9b788da32f05
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

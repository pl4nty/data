-- Threat: !InfrastructureShared
-- Name: 9278a6c1583e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

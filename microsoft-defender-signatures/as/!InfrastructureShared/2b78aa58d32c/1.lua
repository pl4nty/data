-- Threat: !InfrastructureShared
-- Name: 2b78aa58d32c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

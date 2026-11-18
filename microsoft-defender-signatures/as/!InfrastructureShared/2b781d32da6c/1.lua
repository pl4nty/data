-- Threat: !InfrastructureShared
-- Name: 2b781d32da6c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

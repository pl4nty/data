-- Threat: !InfrastructureShared
-- Name: 607899206e4e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

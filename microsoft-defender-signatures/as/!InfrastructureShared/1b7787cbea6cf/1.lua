-- Threat: !InfrastructureShared
-- Name: 1b7787cbea6cf
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

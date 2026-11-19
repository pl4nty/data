-- Threat: !InfrastructureShared
-- Name: 3e782b83dba1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

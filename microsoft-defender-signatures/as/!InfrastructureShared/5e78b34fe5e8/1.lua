-- Threat: !InfrastructureShared
-- Name: 5e78b34fe5e8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

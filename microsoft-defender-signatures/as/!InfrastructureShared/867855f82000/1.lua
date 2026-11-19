-- Threat: !InfrastructureShared
-- Name: 867855f82000
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

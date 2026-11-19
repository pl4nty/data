-- Threat: !InfrastructureShared
-- Name: 47781cb46436
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

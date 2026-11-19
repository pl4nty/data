-- Threat: !InfrastructureShared
-- Name: b87838ccf254
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

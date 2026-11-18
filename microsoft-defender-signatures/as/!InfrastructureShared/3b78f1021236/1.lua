-- Threat: !InfrastructureShared
-- Name: 3b78f1021236
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: b67803c5dc42
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

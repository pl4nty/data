-- Threat: !InfrastructureShared
-- Name: 5e78c256b2bc
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

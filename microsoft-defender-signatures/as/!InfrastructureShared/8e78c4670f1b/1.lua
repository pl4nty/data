-- Threat: !InfrastructureShared
-- Name: 8e78c4670f1b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

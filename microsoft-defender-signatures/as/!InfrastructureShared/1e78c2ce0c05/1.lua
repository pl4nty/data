-- Threat: !InfrastructureShared
-- Name: 1e78c2ce0c05
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

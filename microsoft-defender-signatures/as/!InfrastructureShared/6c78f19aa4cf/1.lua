-- Threat: !InfrastructureShared
-- Name: 6c78f19aa4cf
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

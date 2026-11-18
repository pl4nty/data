-- Threat: !InfrastructureShared
-- Name: c17803e469de
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

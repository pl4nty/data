-- Threat: !InfrastructureShared
-- Name: fb780efd6d23
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

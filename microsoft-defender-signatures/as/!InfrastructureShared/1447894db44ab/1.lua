-- Threat: !InfrastructureShared
-- Name: 1447894db44ab
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

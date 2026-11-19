-- Threat: !InfrastructureShared
-- Name: 7e7875df25b7
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

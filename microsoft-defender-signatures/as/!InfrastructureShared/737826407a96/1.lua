-- Threat: !InfrastructureShared
-- Name: 737826407a96
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 537822a74c79
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

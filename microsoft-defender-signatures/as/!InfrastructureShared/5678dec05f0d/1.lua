-- Threat: !InfrastructureShared
-- Name: 5678dec05f0d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

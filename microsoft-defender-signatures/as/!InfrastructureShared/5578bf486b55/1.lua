-- Threat: !InfrastructureShared
-- Name: 5578bf486b55
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

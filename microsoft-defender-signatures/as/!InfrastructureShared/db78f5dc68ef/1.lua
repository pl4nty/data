-- Threat: !InfrastructureShared
-- Name: db78f5dc68ef
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 5a78cdbf7eb9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

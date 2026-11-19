-- Threat: !InfrastructureShared
-- Name: 10b78be477e20
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

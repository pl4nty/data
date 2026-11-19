-- Threat: !InfrastructureShared
-- Name: 817828644d1e
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

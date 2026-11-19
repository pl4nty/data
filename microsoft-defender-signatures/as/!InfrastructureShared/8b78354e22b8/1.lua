-- Threat: !InfrastructureShared
-- Name: 8b78354e22b8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

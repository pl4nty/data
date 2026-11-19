-- Threat: !InfrastructureShared
-- Name: 6578f5b52991
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 6f785d90e9df
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

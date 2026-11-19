-- Threat: !InfrastructureShared
-- Name: 117618bd584ca
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

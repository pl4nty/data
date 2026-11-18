-- Threat: !InfrastructureShared
-- Name: 6b61ac3c2bf5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 5b7845bc8b61
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

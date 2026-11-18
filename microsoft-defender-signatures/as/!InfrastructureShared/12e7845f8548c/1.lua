-- Threat: !InfrastructureShared
-- Name: 12e7845f8548c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

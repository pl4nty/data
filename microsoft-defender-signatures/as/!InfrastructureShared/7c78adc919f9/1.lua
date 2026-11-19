-- Threat: !InfrastructureShared
-- Name: 7c78adc919f9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

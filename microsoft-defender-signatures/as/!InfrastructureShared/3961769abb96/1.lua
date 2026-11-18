-- Threat: !InfrastructureShared
-- Name: 3961769abb96
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN

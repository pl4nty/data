-- Threat: !InfrastructureShared
-- Name: 5878b48fdfc7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

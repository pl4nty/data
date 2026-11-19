-- Threat: !InfrastructureShared
-- Name: 9178c89c51d3
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

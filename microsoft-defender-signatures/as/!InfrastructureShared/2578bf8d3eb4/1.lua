-- Threat: !InfrastructureShared
-- Name: 2578bf8d3eb4
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

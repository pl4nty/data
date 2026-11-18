-- Threat: !InfrastructureShared
-- Name: 9c78a7d3f9dc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

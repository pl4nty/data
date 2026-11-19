-- Threat: !InfrastructureShared
-- Name: 6d78fef8d7d3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

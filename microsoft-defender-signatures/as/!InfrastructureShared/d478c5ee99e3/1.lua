-- Threat: !InfrastructureShared
-- Name: d478c5ee99e3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

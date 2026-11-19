-- Threat: !InfrastructureShared
-- Name: 1207866d3419c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

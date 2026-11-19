-- Threat: !InfrastructureShared
-- Name: 667845d3285e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

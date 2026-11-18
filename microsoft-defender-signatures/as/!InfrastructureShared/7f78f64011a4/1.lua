-- Threat: !InfrastructureShared
-- Name: 7f78f64011a4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: f4783c03b1e2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: e5615d3cb59b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

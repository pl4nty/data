-- Threat: !InfrastructureShared
-- Name: a578b48e2e03
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

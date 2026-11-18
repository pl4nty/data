-- Threat: !InfrastructureShared
-- Name: 5e781911e03b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

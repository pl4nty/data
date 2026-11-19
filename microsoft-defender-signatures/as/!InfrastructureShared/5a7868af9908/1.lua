-- Threat: !InfrastructureShared
-- Name: 5a7868af9908
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

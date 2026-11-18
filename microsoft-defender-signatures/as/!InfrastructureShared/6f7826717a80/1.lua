-- Threat: !InfrastructureShared
-- Name: 6f7826717a80
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

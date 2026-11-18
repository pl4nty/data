-- Threat: !InfrastructureShared
-- Name: 155405e61ef5c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: a561fc9eee9c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

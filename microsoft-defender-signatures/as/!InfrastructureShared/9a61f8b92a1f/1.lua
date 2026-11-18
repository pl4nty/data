-- Threat: !InfrastructureShared
-- Name: 9a61f8b92a1f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

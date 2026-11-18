-- Threat: !InfrastructureShared
-- Name: a978c046c71b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

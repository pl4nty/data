-- Threat: !InfrastructureShared
-- Name: 7e78129a5254
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

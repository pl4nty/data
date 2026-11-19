-- Threat: !InfrastructureShared
-- Name: 3578ce941095
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

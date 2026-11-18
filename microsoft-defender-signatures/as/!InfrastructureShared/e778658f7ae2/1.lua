-- Threat: !InfrastructureShared
-- Name: e778658f7ae2
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: a540cc8018d9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

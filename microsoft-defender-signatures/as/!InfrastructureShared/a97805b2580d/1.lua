-- Threat: !InfrastructureShared
-- Name: a97805b2580d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

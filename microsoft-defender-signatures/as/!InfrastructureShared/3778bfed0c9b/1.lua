-- Threat: !InfrastructureShared
-- Name: 3778bfed0c9b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 75400040b0ee
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 4961dc0df705
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN

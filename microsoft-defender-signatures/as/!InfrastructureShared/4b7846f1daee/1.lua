-- Threat: !InfrastructureShared
-- Name: 4b7846f1daee
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN

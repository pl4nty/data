-- Threat: !InfrastructureShared
-- Name: 19b78c615f9fa
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

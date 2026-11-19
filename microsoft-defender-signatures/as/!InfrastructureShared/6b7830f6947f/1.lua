-- Threat: !InfrastructureShared
-- Name: 6b7830f6947f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

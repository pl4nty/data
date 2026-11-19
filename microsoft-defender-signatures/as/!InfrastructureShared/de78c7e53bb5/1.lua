-- Threat: !InfrastructureShared
-- Name: de78c7e53bb5
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

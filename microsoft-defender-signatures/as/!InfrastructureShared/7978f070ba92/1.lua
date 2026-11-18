-- Threat: !InfrastructureShared
-- Name: 7978f070ba92
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

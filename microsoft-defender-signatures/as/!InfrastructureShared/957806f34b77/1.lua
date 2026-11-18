-- Threat: !InfrastructureShared
-- Name: 957806f34b77
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

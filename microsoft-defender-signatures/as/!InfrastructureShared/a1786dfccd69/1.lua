-- Threat: !InfrastructureShared
-- Name: a1786dfccd69
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

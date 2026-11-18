-- Threat: !InfrastructureShared
-- Name: 957812f81b3c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

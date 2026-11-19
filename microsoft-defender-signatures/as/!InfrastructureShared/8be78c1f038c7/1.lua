-- Threat: !InfrastructureShared
-- Name: 8be78c1f038c7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

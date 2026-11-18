-- Threat: !InfrastructureShared
-- Name: 3f78f259284f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

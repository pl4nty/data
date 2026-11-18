-- Threat: !InfrastructureShared
-- Name: 4d7858f548e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

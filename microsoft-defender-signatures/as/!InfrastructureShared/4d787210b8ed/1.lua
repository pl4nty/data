-- Threat: !InfrastructureShared
-- Name: 4d787210b8ed
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

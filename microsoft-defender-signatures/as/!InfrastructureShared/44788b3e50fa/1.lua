-- Threat: !InfrastructureShared
-- Name: 44788b3e50fa
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

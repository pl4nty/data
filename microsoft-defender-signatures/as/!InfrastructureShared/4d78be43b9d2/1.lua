-- Threat: !InfrastructureShared
-- Name: 4d78be43b9d2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

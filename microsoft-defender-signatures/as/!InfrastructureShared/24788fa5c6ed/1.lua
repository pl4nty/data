-- Threat: !InfrastructureShared
-- Name: 24788fa5c6ed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

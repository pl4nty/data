-- Threat: !InfrastructureShared
-- Name: 5d78451a03ef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

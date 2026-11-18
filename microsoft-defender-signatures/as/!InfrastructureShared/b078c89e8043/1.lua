-- Threat: !InfrastructureShared
-- Name: b078c89e8043
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

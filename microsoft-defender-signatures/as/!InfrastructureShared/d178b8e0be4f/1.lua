-- Threat: !InfrastructureShared
-- Name: d178b8e0be4f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

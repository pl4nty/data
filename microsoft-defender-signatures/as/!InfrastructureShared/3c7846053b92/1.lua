-- Threat: !InfrastructureShared
-- Name: 3c7846053b92
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

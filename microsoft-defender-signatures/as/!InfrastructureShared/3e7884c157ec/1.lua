-- Threat: !InfrastructureShared
-- Name: 3e7884c157ec
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

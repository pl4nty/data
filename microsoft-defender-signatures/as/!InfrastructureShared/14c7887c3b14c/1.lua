-- Threat: !InfrastructureShared
-- Name: 14c7887c3b14c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

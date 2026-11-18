-- Threat: !InfrastructureShared
-- Name: 5d782d8e93d1
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

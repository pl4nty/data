-- Threat: !InfrastructureShared
-- Name: 4978a3639b9c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

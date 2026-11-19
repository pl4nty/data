-- Threat: !InfrastructureShared
-- Name: 767817a0cd45
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

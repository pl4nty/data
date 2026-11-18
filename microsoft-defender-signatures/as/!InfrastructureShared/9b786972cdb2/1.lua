-- Threat: !InfrastructureShared
-- Name: 9b786972cdb2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

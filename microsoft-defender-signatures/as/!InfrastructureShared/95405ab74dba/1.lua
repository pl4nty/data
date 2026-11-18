-- Threat: !InfrastructureShared
-- Name: 95405ab74dba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

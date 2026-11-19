-- Threat: !InfrastructureShared
-- Name: 2d781c858875
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

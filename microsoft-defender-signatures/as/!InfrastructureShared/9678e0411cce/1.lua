-- Threat: !InfrastructureShared
-- Name: 9678e0411cce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

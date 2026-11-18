-- Threat: !InfrastructureShared
-- Name: ec78f4419606
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

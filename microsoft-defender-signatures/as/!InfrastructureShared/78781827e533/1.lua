-- Threat: !InfrastructureShared
-- Name: 78781827e533
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

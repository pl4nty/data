-- Threat: !InfrastructureShared
-- Name: 12178187c7f86
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

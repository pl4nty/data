-- Threat: !InfrastructureShared
-- Name: 717860baa5b6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

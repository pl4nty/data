-- Threat: !InfrastructureShared
-- Name: 1087812408ee2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

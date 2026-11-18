-- Threat: !InfrastructureShared
-- Name: bb785d8c4891
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

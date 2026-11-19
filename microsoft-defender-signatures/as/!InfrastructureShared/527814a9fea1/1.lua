-- Threat: !InfrastructureShared
-- Name: 527814a9fea1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

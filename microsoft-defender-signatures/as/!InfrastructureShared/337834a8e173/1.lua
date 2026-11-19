-- Threat: !InfrastructureShared
-- Name: 337834a8e173
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

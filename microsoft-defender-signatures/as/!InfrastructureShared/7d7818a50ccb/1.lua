-- Threat: !InfrastructureShared
-- Name: 7d7818a50ccb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

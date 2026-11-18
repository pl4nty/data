-- Threat: !InfrastructureShared
-- Name: 100786fd61028
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

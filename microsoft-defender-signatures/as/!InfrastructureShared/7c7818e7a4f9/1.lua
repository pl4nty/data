-- Threat: !InfrastructureShared
-- Name: 7c7818e7a4f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

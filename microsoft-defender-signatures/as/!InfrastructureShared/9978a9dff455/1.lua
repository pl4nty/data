-- Threat: !InfrastructureShared
-- Name: 9978a9dff455
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

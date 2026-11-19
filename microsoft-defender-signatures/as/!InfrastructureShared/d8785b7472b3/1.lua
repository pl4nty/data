-- Threat: !InfrastructureShared
-- Name: d8785b7472b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

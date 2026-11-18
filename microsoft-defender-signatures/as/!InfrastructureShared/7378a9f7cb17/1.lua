-- Threat: !InfrastructureShared
-- Name: 7378a9f7cb17
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

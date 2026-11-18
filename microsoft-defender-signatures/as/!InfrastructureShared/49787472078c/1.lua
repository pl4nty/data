-- Threat: !InfrastructureShared
-- Name: 49787472078c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

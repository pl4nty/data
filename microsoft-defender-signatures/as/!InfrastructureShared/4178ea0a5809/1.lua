-- Threat: !InfrastructureShared
-- Name: 4178ea0a5809
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

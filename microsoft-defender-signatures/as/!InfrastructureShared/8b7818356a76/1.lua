-- Threat: !InfrastructureShared
-- Name: 8b7818356a76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

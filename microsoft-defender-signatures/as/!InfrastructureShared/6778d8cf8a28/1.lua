-- Threat: !InfrastructureShared
-- Name: 6778d8cf8a28
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 49784b625d9b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 75783846f6b7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

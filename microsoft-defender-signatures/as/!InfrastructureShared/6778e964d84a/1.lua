-- Threat: !InfrastructureShared
-- Name: 6778e964d84a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

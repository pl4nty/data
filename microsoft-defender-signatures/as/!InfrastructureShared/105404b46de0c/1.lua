-- Threat: !InfrastructureShared
-- Name: 105404b46de0c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

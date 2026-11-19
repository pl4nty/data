-- Threat: !InfrastructureShared
-- Name: 3178e88b7081
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

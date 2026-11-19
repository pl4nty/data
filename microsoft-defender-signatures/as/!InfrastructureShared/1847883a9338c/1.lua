-- Threat: !InfrastructureShared
-- Name: 1847883a9338c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

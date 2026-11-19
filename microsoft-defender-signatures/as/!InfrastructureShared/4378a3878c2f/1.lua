-- Threat: !InfrastructureShared
-- Name: 4378a3878c2f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7878ff9c46f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

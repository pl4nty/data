-- Threat: !InfrastructureShared
-- Name: 6378abab2667
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

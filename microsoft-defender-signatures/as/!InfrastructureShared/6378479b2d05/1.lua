-- Threat: !InfrastructureShared
-- Name: 6378479b2d05
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

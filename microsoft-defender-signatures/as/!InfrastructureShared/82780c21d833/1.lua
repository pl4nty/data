-- Threat: !InfrastructureShared
-- Name: 82780c21d833
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

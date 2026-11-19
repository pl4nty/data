-- Threat: !InfrastructureShared
-- Name: 18c61a4113619
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

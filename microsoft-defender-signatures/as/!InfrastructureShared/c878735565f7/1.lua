-- Threat: !InfrastructureShared
-- Name: c878735565f7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

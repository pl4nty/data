-- Threat: !InfrastructureShared
-- Name: 16d7890bfaa53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

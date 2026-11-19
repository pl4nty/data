-- Threat: !InfrastructureShared
-- Name: 58782ae94003
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

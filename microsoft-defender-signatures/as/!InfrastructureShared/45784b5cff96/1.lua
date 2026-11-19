-- Threat: !InfrastructureShared
-- Name: 45784b5cff96
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

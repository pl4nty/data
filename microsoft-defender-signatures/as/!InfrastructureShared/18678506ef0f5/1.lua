-- Threat: !InfrastructureShared
-- Name: 18678506ef0f5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 9e78e7bd738b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

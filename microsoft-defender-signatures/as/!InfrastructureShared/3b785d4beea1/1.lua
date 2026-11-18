-- Threat: !InfrastructureShared
-- Name: 3b785d4beea1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

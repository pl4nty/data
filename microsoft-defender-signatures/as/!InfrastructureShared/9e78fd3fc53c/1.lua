-- Threat: !InfrastructureShared
-- Name: 9e78fd3fc53c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

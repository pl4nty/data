-- Threat: !InfrastructureShared
-- Name: 8878cc24c34f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

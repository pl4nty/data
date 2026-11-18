-- Threat: !InfrastructureShared
-- Name: 4578ab3c66db
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

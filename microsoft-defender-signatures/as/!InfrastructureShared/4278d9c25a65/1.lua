-- Threat: !InfrastructureShared
-- Name: 4278d9c25a65
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

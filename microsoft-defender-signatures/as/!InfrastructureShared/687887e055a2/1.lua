-- Threat: !InfrastructureShared
-- Name: 687887e055a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

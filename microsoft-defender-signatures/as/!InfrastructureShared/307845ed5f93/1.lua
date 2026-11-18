-- Threat: !InfrastructureShared
-- Name: 307845ed5f93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

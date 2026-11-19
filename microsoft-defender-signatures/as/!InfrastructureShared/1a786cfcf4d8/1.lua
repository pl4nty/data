-- Threat: !InfrastructureShared
-- Name: 1a786cfcf4d8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

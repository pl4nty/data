-- Threat: !InfrastructureShared
-- Name: 6e7876379c10
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

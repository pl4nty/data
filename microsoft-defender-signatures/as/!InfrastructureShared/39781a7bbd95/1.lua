-- Threat: !InfrastructureShared
-- Name: 39781a7bbd95
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

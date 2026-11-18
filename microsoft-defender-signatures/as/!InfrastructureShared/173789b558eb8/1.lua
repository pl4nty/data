-- Threat: !InfrastructureShared
-- Name: 173789b558eb8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

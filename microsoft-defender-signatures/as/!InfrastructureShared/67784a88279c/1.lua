-- Threat: !InfrastructureShared
-- Name: 67784a88279c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

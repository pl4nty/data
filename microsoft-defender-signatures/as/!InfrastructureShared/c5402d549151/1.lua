-- Threat: !InfrastructureShared
-- Name: c5402d549151
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

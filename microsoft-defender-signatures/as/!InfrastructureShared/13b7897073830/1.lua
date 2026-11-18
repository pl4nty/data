-- Threat: !InfrastructureShared
-- Name: 13b7897073830
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 13540c8ff9507
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

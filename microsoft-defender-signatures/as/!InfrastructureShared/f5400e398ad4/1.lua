-- Threat: !InfrastructureShared
-- Name: f5400e398ad4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

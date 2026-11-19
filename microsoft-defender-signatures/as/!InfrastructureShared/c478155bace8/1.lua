-- Threat: !InfrastructureShared
-- Name: c478155bace8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

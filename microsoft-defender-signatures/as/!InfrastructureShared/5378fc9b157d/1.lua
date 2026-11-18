-- Threat: !InfrastructureShared
-- Name: 5378fc9b157d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

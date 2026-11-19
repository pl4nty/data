-- Threat: !InfrastructureShared
-- Name: fb618ee24ee4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

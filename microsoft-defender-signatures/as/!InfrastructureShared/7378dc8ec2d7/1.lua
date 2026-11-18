-- Threat: !InfrastructureShared
-- Name: 7378dc8ec2d7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

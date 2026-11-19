-- Threat: !InfrastructureShared
-- Name: b678ec2de945
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7778ec2aefcf
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

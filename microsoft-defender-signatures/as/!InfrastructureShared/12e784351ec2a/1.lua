-- Threat: !InfrastructureShared
-- Name: 12e784351ec2a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

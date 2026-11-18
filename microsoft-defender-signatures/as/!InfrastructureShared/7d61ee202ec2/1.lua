-- Threat: !InfrastructureShared
-- Name: 7d61ee202ec2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

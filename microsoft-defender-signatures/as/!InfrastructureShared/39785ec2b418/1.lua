-- Threat: !InfrastructureShared
-- Name: 39785ec2b418
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

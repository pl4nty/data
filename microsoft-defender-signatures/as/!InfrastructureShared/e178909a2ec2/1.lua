-- Threat: !InfrastructureShared
-- Name: e178909a2ec2
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

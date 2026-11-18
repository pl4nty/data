-- Threat: !InfrastructureShared
-- Name: 5378aaa2a209
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

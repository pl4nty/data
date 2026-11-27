-- Threat: !InfrastructureShared
-- Name: a378f0a9e38f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

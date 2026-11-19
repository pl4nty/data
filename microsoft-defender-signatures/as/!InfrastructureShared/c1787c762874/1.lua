-- Threat: !InfrastructureShared
-- Name: c1787c762874
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

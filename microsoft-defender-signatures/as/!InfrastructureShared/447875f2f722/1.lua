-- Threat: !InfrastructureShared
-- Name: 447875f2f722
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

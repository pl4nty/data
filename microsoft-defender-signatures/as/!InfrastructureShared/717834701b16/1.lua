-- Threat: !InfrastructureShared
-- Name: 717834701b16
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

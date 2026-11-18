-- Threat: !InfrastructureShared
-- Name: 6e78213b1581
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

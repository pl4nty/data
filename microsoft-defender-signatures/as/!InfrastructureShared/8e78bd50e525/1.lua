-- Threat: !InfrastructureShared
-- Name: 8e78bd50e525
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

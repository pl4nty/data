-- Threat: !InfrastructureShared
-- Name: b0783da3b00b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

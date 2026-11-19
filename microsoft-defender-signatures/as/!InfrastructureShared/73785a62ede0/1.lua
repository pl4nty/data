-- Threat: !InfrastructureShared
-- Name: 73785a62ede0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

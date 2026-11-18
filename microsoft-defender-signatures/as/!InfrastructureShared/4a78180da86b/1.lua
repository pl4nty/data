-- Threat: !InfrastructureShared
-- Name: 4a78180da86b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

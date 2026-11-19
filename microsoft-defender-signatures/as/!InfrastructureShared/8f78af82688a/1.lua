-- Threat: !InfrastructureShared
-- Name: 8f78af82688a
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

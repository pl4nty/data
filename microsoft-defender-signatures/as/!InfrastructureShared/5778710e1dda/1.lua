-- Threat: !InfrastructureShared
-- Name: 5778710e1dda
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

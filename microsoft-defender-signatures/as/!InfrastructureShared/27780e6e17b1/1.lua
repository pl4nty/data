-- Threat: !InfrastructureShared
-- Name: 27780e6e17b1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

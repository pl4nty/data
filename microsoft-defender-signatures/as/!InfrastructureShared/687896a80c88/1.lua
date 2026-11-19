-- Threat: !InfrastructureShared
-- Name: 687896a80c88
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

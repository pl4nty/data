-- Threat: !InfrastructureShared
-- Name: e3787a64f54b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

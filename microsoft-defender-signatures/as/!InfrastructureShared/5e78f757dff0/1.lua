-- Threat: !InfrastructureShared
-- Name: 5e78f757dff0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

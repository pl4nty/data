-- Threat: !InfrastructureShared
-- Name: a078234a1b01
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 8b78da10e6d0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

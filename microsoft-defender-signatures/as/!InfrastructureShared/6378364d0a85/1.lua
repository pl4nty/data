-- Threat: !InfrastructureShared
-- Name: 6378364d0a85
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

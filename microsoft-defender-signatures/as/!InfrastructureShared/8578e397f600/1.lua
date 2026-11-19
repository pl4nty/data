-- Threat: !InfrastructureShared
-- Name: 8578e397f600
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

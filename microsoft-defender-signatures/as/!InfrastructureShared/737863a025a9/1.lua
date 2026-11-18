-- Threat: !InfrastructureShared
-- Name: 737863a025a9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

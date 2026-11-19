-- Threat: !InfrastructureShared
-- Name: b37882d07b89
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

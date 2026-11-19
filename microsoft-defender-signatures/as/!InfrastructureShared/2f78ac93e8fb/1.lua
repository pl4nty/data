-- Threat: !InfrastructureShared
-- Name: 2f78ac93e8fb
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

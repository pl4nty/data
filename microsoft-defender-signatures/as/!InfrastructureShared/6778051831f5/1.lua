-- Threat: !InfrastructureShared
-- Name: 6778051831f5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

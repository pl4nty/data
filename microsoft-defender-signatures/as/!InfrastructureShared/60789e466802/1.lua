-- Threat: !InfrastructureShared
-- Name: 60789e466802
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

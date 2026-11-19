-- Threat: !InfrastructureShared
-- Name: 52781d368eaa
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

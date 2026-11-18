-- Threat: !InfrastructureShared
-- Name: ac78e4cd0464
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

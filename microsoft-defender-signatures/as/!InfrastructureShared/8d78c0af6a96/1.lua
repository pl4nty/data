-- Threat: !InfrastructureShared
-- Name: 8d78c0af6a96
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

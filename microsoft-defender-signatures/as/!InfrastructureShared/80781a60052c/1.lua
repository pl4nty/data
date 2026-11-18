-- Threat: !InfrastructureShared
-- Name: 80781a60052c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

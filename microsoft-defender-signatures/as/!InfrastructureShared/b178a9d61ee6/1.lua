-- Threat: !InfrastructureShared
-- Name: b178a9d61ee6
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

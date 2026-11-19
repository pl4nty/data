-- Threat: !InfrastructureShared
-- Name: 8278f88aa304
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

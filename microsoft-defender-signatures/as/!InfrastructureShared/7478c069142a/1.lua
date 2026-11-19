-- Threat: !InfrastructureShared
-- Name: 7478c069142a
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 85615fcf01d3
-- Type: 21

if peattributes.ismsil and peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

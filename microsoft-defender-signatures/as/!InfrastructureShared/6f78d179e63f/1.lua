-- Threat: !InfrastructureShared
-- Name: 6f78d179e63f
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN

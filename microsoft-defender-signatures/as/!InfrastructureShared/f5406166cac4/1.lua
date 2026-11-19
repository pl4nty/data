-- Threat: !InfrastructureShared
-- Name: f5406166cac4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() < 11000 then
  return mp.INFECTED
end
return mp.CLEAN

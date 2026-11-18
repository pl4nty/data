-- Threat: !InfrastructureShared
-- Name: 6e78b11854a2
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() < 75000 then
  return mp.INFECTED
end
return mp.CLEAN
